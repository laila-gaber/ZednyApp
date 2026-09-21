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
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageWrapper(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ToastManager.showSuccess(S.of(context).loginSuccessful);
            Future.delayed(const Duration(seconds: 1), () {
              // Navigate to home screen
            });
          } else if (state is LoginFailure) {
            ToastManager.showError(state.message);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is LoginLoading;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: S.of(context).welcomeBack,
                  subtitle: S.of(context).loginToContinue,
                  showBackButton: false,
                ),
                80.sbh,
                AuthTextField(
                  label: S.of(context).phoneNumber,
                  hint: S.of(context).phoneHint,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return S.of(context).phoneIsRequired;
                    if (value!.length < 11) return S.of(context).invalidPhoneNumber;
                    return null;
                  },
                ),
                24.sbh,
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        activeColor: MyColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    12.sbw,
                    Text(
                      S.of(context).rememberMe,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.myBlack,
                      ),
                    ),
                  ],
                ),
                80.sbh,
                AuthButton(
                  label: S.of(context).login,
                  isLoading: isLoading,
                  onPressed: () {
                    if (phoneController.text.isEmpty) {
                      ToastManager.showError(S.of(context).pleaseEnterPhoneNumber);
                      return;
                    }
                    if (phoneController.text.length < 11) {
                      ToastManager.showError(S.of(context).phoneAtLeast11Digits);
                      return;
                    }
                    context.read<AuthCubit>().login(
                          phone: phoneController.text,
                          userType: 'STUDENT',
                          fcmToken: 'fcm_token_placeholder',
                          rememberMe: rememberMe,
                        );
                  },
                ),
                20.sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).dontHaveAccount,
                      style: const TextStyle(
                        fontSize: 14,
                        color: MyColors.myBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.register);
                      },
                      child: Text(
                        S.of(context).register,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: MyColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
