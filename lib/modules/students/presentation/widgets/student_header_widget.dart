import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';

class StudentHeaderWidget extends StatelessWidget {
  final int totalCount;

  const StudentHeaderWidget({
    super.key,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.studentsList,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: MyColors.myBlack,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            2.sbh,
            Text(
              '${s.totalStudents}: $totalCount',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MyColors.myGrey,
                  ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: MyColors.softBlue.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: MyColors.softBlue.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.people,
                size: 18,
                color: MyColors.primary,
              ),
              6.sbw,
              Text(
                '$totalCount',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
