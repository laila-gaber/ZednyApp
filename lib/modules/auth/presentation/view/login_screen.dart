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
import '../widgets/auth_navigation_row.dart';
import '../widgets/auth_page_wrapper.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/remember_me_checkbox.dart';
import '../widgets/user_type_selector.dart';
import 'otp_verification_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final s = S.of(context);

    return AuthPageWrapper(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SendOtpSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: cubit,
                  child: OtpVerificationScreen(
                    phone: state.phone,
                    refNo: state.refNo,
                    authType: 'login',
                  ),
                ),
              ),
            );
          } else if (state is SendOtpFailure) {
            ToastManager.showError(state.message);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is SendOtpLoading;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: s.welcomeBack,
                  subtitle: s.loginToContinue,
                  showBackButton: false,
                ),
                24.sbh,
                Text(
                  s.loginAs,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                8.sbh,
                const UserTypeSelector(),
                40.sbh,
                AuthTextField(
                  label: s.phoneNumber,
                  hint: s.phoneHint,
                  controller: cubit.loginPhoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return s.phoneIsRequired;
                    if (value!.length < 11) return s.invalidPhoneNumber;
                    return null;
                  },
                ),
                24.sbh,
                const RememberMeCheckbox(),
                40.sbh,
                AuthButton(
                  label: s.login,
                  isLoading: isLoading,
                  onPressed: () => cubit.sendLoginOtp(s),
                ),
                20.sbh,
                AuthNavigationRow(
                  text: s.dontHaveAccount,
                  actionText: s.register,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.register);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
