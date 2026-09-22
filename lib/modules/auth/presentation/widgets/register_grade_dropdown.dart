import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';

class RegisterGradeDropdown extends StatelessWidget {
  const RegisterGradeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).grade,
          style: Theme.of(context).textTheme.titleMedium,
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
            value: cubit.selectedGrade,
            isExpanded: true,
            underline: const SizedBox(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            style: Theme.of(context).textTheme.bodyLarge,
            items: cubit.grades
                .map((grade) => DropdownMenuItem(
                      value: grade,
                      child: Text(
                        grade,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                cubit.changeGrade(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
