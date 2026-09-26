import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';

class OtpTimerDisplay extends StatelessWidget {
  const OtpTimerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();
    final isExpired = cubit.isOtpExpired;

    return Center(
      child: Column(
        children: [
          Text(
            S.of(context).codeExpiresIn,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          8.sbh,
          Text(
            cubit.formattedTimer,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: isExpired ? MyColors.red : MyColors.primary,
                ),
          ),
        ],
      ),
    );
  }
}
