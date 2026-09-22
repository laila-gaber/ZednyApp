import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';

class RememberMeCheckbox extends StatelessWidget {
  const RememberMeCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();

    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: cubit.rememberMe,
            onChanged: (value) => cubit.toggleRememberMe(value),
            activeColor: MyColors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        12.sbw,
        Text(
          S.of(context).rememberMe,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
