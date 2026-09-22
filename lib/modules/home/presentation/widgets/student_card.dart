import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/student_model.dart';

class StudentCard extends StatelessWidget {
  final StudentModel student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColors.myGrey.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (student.warningsCount > 0 || student.isBlocked)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (student.warningsCount > 0)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: MyColors.red.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${student.warningsCount} ${s.warning}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: MyColors.red,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                if (student.warningsCount > 0 && student.isBlocked) 8.sbw,
                if (student.isBlocked)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: MyColors.red.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      s.blocked,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: MyColors.red,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
              ],
            ),
          const Spacer(),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  student.name,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyColors.myBlack,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                4.sbh,
                Text(
                  '${student.grade} · ${student.completedLectures}/${student.totalLectures} ${s.lectures}',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColors.myGrey,
                      ),
                ),
              ],
            ),
          ),
          12.sbw,
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: MyColors.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              student.avatarInitial,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
