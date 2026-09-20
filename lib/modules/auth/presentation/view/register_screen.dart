import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
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

  bool _validateInputs() {
    if (phoneController.text.isEmpty) {
      _showError('Please enter your phone number');
      return false;
    }
    if (phoneController.text.length < 11) {
      _showError('Phone number must be at least 11 digits');
      return false;
    }
    if (nameController.text.isEmpty) {
      _showError('Please enter your name');
      return false;
    }
    if (parentPhoneController.text.isEmpty) {
      _showError('Please enter parent phone number');
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
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
            _showError(state.message);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is SendOtpLoading;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: 'Create Account',
                  subtitle: 'Register as a student to get started',
                  showBackButton: true,
                ),
                60.sbh,
                AuthTextField(
                  label: 'Phone Number',
                  hint: '01234567890',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Phone is required';
                    if (value!.length < 11) return 'Invalid phone number';
                    return null;
                  },
                ),
                20.sbh,
                AuthTextField(
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Name is required';
                    return null;
                  },
                ),
                20.sbh,
                AuthTextField(
                  label: 'Parent Phone Number',
                  hint: '01234567890',
                  controller: parentPhoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: MyColors.blue,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Parent phone is required';
                    if (value!.length < 11) return 'Invalid phone number';
                    return null;
                  },
                ),
                20.sbh,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Grade',
                      style: TextStyle(
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
                  label: 'Continue',
                  isLoading: isLoading,
                  onPressed: () {
                    if (_validateInputs()) {
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
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.myBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'Login',
                        style: TextStyle(
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
