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
import 'register_screen.dart';

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

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageWrapper(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            _showSuccess('Login successful!');
            Future.delayed(const Duration(seconds: 1), () {
              // Navigate to home screen
              // Navigator.of(context).pushReplacementNamed('/home');
            });
          } else if (state is LoginFailure) {
            _showError(state.message);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is LoginLoading;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: 'Welcome Back',
                  subtitle: 'Login to your account to continue',
                  showBackButton: false,
                ),
                80.sbh,
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
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.myBlack,
                      ),
                    ),
                  ],
                ),
                80.sbh,
                AuthButton(
                  label: 'Login',
                  isLoading: isLoading,
                  onPressed: () {
                    if (phoneController.text.isEmpty) {
                      _showError('Please enter your phone number');
                      return;
                    }
                    if (phoneController.text.length < 11) {
                      _showError('Phone number must be at least 11 digits');
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
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.myBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Register',
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
