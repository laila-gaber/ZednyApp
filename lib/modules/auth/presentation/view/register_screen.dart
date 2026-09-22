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
import '../widgets/register_grade_dropdown.dart';
import 'otp_verification_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    authType: 'register',
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
                  title: s.createAccount,
                  subtitle: s.registerAsStudentSubtitle,
                  showBackButton: false,
                ),
                60.sbh,
                AuthTextField(
                  label: s.phoneNumber,
                  hint: s.phoneHint,
                  controller: cubit.registerPhoneController,
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
                20.sbh,
                AuthTextField(
                  label: s.fullName,
                  hint: s.enterYourFullName,
                  controller: cubit.nameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return s.nameIsRequired;
                    return null;
                  },
                ),
                20.sbh,
                AuthTextField(
                  label: s.parentPhoneNumber,
                  hint: s.phoneHint,
                  controller: cubit.parentPhoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return s.parentPhoneIsRequired;
                    if (value!.length < 11) return s.invalidPhoneNumber;
                    return null;
                  },
                ),
                20.sbh,
                const RegisterGradeDropdown(),
                60.sbh,
                AuthButton(
                  label: s.continueText,
                  isLoading: isLoading,
                  onPressed: () => cubit.submitRegister(s),
                ),
                16.sbh,
                AuthNavigationRow(
                  text: s.alreadyHaveAccount,
                  actionText: s.login,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
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
