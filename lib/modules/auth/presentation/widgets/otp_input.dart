import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/values/my_colors.dart';
import '../cubit/auth_cubit.dart';

class OtpInput extends StatelessWidget {
  final int length;
  final void Function(String)? onCompleted;

  const OtpInput({
    super.key,
    this.length = 4,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: Theme.of(context).textTheme.headlineMedium,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.inputBorder, width: 1.5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: MyColors.blue, width: 2.5),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: MyColors.blue, width: 1.5),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: MyColors.red, width: 1.5),
      ),
    );

    return Pinput(
      length: length,
      controller: cubit.otpController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      showCursor: true,
      onCompleted: onCompleted,
      onChanged: (pin) {
        cubit.otpController.text = pin;
      },
    );
  }
}
