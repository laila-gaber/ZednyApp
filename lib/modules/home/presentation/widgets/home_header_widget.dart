import 'package:flutter/material.dart';

import '../../../../core/enums/grade_enum.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/utils/Utilities.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';

class HomeHeaderWidget extends StatelessWidget {
  final Profile? currentUser;
  final GradeEnum selectedGrade;
  final ValueChanged<GradeEnum> onGradeSelected;

  const HomeHeaderWidget({
    super.key,
    required this.currentUser,
    required this.selectedGrade,
    required this.onGradeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isTeacher = currentUser?.isTeacher ?? false;
    final userName = currentUser?.name ?? s.welcome;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.sbh,
                Text(
                  '${s.welcome}، $userName 👋',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: MyColors.myBlack,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                2.sbh,
                Text(
                  isTeacher ? s.welcomeTeacher : s.welcomeStudent,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColors.myGrey,
                      ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: MyColors.softBlue.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: MyColors.softBlue.withValues(alpha: 0.4),
                ),
              ),
              child: Text(
                isTeacher ? s.teacher : s.student,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        16.sbh,
        SizedBox(
          height: 38,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            reverse: false,
            physics: const BouncingScrollPhysics(),
            itemCount: GradeEnum.values.length,
            separatorBuilder: (context, index) => 8.sbw,
            itemBuilder: (context, index) {
              final grade = GradeEnum.values[index];
              final isSelected = grade == selectedGrade;

              return GestureDetector(
                onTap: () => onGradeSelected(grade),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? MyColors.primary : MyColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? MyColors.primary
                          : MyColors.inputBorder,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: MyColors.primary.withValues(alpha: 0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    grade.getLocalizedName(context),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isSelected ? MyColors.white : MyColors.myBlack,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                        ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
