import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_page_wrapper.dart';
import '../widgets/otp_input.dart';
import 'login_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
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
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late GlobalKey<OtpInputState> otpKey;
  late TextEditingController otpController;
  int remainingSeconds = 120;
  late Future<void> timerFuture;

  @override
  void initState() {
    super.initState();
    otpKey = GlobalKey<OtpInputState>();
    otpController = TextEditingController();
    _startTimer();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          remainingSeconds--;
        });
      }
      return remainingSeconds > 0 && mounted;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
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
          if (state is VerifyOtpSuccess) {
            _showSuccess('Phone verified successfully!');
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              }
            });
          } else if (state is VerifyOtpFailure) {
            _showError(state.message);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is VerifyOtpLoading;
            final isExpired = remainingSeconds <= 0;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: 'Verify OTP',
                  subtitle:
                      'We sent a code to ${widget.phone}. Enter it below.',
                  showBackButton: true,
                ),
                60.sbh,
                Center(
                  child: OtpInput(
                    key: otpKey,
                    length: 4,
                    onCompleted: (otp) {
                      otpController.text = otp;
                    },
                  ),
                ),
                40.sbh,
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Code expires in',
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColors.myGrey,
                        ),
                      ),
                      8.sbh,
                      Text(
                        _formatTime(remainingSeconds),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: isExpired ? Colors.red : MyColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                60.sbh,
                AuthButton(
                  label: 'Verify',
                  isLoading: isLoading,
                  backgroundColor: isExpired ? MyColors.myGrey : MyColors.blue,
                  onPressed: isExpired
                      ? null
                      : () {
                          final otp = otpKey.currentState?.getOTP();
                          if (otp == null || otp.isEmpty) {
                            _showError('Please enter the OTP');
                            return;
                          }
                          if (otp.length < 4) {
                            _showError('OTP must be 4 digits');
                            return;
                          }
                          context.read<AuthCubit>().verifyOtp(
                                phone: widget.phone,
                                otp: otp,
                                refNo: widget.refNo,
                              );
                        },
                ),
                20.sbh,
                if (!isExpired)
                  Center(
                    child: GestureDetector(
                      onTap: isExpired
                          ? null
                          : () {
                              _showSuccess('OTP resent to your phone');
                              setState(() {
                                remainingSeconds = 120;
                              });
                              _startTimer();
                            },
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isExpired
                              ? MyColors.myGrey
                              : MyColors.blue,
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
