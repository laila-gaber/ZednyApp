import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';

class StudentsHeader extends StatelessWidget {
  const StudentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            s.students,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          4.sbh,
          Text(
            s.registeredCount,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: MyColors.descriptionColor,
                ),
          ),
        ],
      ),
    );
  }
}
