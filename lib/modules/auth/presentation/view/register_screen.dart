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
import 'otp_verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController parentPhoneController;
  late TextEditingController fcmTokenController;

  String selectedGrade = 'FIRST';
  final List<String> grades = [
    'FIRST',
    'SECOND',
    'THIRD',
    'FOURTH',
    'FIFTH',
    'SIXTH'
  ];

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    parentPhoneController = TextEditingController();
    fcmTokenController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    parentPhoneController.dispose();
    fcmTokenController.dispose();
    super.dispose();
  }

  bool _validateInputs(BuildContext context) {
    if (phoneController.text.isEmpty) {
      ToastManager.showError(S.of(context).pleaseEnterPhoneNumber);
      return false;
    }
    if (phoneController.text.length < 11) {
      ToastManager.showError(S.of(context).phoneAtLeast11Digits);
      return false;
    }
    if (nameController.text.isEmpty) {
      ToastManager.showError(S.of(context).pleaseEnterName);
      return false;
    }
    if (parentPhoneController.text.isEmpty) {
      ToastManager.showError(S.of(context).pleaseEnterParentPhone);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageWrapper(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SendOtpSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<AuthCubit>(),
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
                  title: S.of(context).createAccount,
                  subtitle: S.of(context).registerAsStudentSubtitle,
                  showBackButton: true,
                ),
                60.sbh,
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
                20.sbh,
                AuthTextField(
                  label: S.of(context).fullName,
                  hint: S.of(context).enterYourFullName,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return S.of(context).nameIsRequired;
                    return null;
                  },
                ),
                20.sbh,
                AuthTextField(
                  label: S.of(context).parentPhoneNumber,
                  hint: S.of(context).phoneHint,
                  controller: parentPhoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return S.of(context).parentPhoneIsRequired;
                    if (value!.length < 11) return S.of(context).invalidPhoneNumber;
                    return null;
                  },
                ),
                20.sbh,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).grade,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: MyColors.myBlack,
                      ),
                    ),
                    8.sbh,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.inputBorder,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButton<String>(
                        value: selectedGrade,
                        isExpanded: true,
                        underline: const SizedBox(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        items: grades
                            .map((grade) => DropdownMenuItem(
                                  value: grade,
                                  child: Text(grade),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedGrade = value;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                60.sbh,
                AuthButton(
                  label: S.of(context).continueText,
                  isLoading: isLoading,
                  onPressed: () {
                    if (_validateInputs(context)) {
                      context.read<AuthCubit>().sendOtp(
                            phone: phoneController.text,
                            authType: 'register',
                            userType: 'STUDENT',
                            name: nameController.text,
                            parentPhone: parentPhoneController.text,
                            garde: selectedGrade,
                            fcmToken: fcmTokenController.text.isNotEmpty
                                ? fcmTokenController.text
                                : 'fcm_token_placeholder',
                          );
                    }
                  },
                ),
                16.sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).alreadyHaveAccount,
                      style: const TextStyle(
                        fontSize: 14,
                        color: MyColors.myBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      },
                      child: Text(
                        S.of(context).login,
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
