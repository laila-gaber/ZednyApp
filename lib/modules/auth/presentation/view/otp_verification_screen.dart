import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/toast_manager.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_page_wrapper.dart';
import '../widgets/otp_input.dart';
import '../widgets/otp_timer_display.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phone;
  final String refNo;
  final String authType;

  const OtpVerificationScreen({
    super.key,
    required this.phone,
    required this.refNo,
    required this.authType,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final s = S.of(context);

    // Start timer on build init via post frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.startOtpTimer();
    });

    return AuthPageWrapper(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyOtpSuccess) {
            ToastManager.showSuccess(s.phoneVerifiedSuccessfully);
            if (authType == 'login') {
              cubit.submitLogin(s);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            }
          } else if (state is LoginSuccess) {
            ToastManager.showSuccess(s.loginSuccessful);
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            );
          } else if (state is VerifyOtpFailure) {
            ToastManager.showError(state.message);
          } else if (state is LoginFailure) {
            ToastManager.showError(state.message);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is VerifyOtpLoading ||
                state is SendOtpLoading ||
                state is LoginLoading;
            final isExpired = cubit.isOtpExpired;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: s.verifyOtp,
                  subtitle: '${s.weSentCodeTo} $phone. ${s.enterItBelow}',
                  showBackButton: true,
                ),
                60.sbh,
                Center(
                  child: OtpInput(
                    length: 4,
                    onCompleted: (otp) {
                      cubit.otpController.text = otp;
                    },
                  ),
                ),
                40.sbh,
                const OtpTimerDisplay(),
                60.sbh,
                AuthButton(
                  label: s.verify,
                  isLoading: isLoading,
                  backgroundColor: isExpired ? MyColors.myGrey : MyColors.blue,
                  onPressed: isExpired
                      ? null
                      : () {
                          cubit.submitVerifyOtp(
                            phone: phone,
                            refNo: refNo,
                            otp: cubit.otpController.text,
                            s: s,
                          );
                        },
                ),
                20.sbh,
                Center(
                  child: GestureDetector(
                    onTap: isLoading
                        ? null
                        : () => cubit.resendOtp(
                              phone: phone,
                              authType: authType,
                              s: s,
                            ),
                    child: Text(
                      s.resendCode,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: MyColors.blue,
                          ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
