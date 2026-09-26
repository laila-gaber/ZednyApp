import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/enums/grade_enum.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/Utilities.dart';
import '../../../../core/values/asstes.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../core/widgets/cahched_img_widget.dart';
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.profile,
                          arguments: currentUser,
                        );
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColors.primary.withValues(alpha: 0.3),
                            width: 2,
                          ),
                          color: MyColors.softBlue.withValues(alpha: 0.2),
                        ),
                        child: ClipOval(
                          child: (currentUser?.imgUrl != null &&
                                  currentUser!.imgUrl!.isNotEmpty)
                              ? CachedImgWidget(
                                  imageUrl: currentUser!.imgUrl!,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                )
                              :  Icon(
                                  Icons.person_rounded,
                                  color: MyColors.primary.myOpacity(0.8),
                                  size: 28,
                                ),
                        ),
                      ),
                    ),
                    10.sbw,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          5.sbh,
                          Text(
                            '${s.welcome}، $userName 👋',
                            style:
                                Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: MyColors.myBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                         /* 2.sbh,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            decoration: BoxDecoration(
                              color: MyColors.softBlue.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: MyColors.softBlue.withValues(alpha: 0.4),
                              ),
                            ),
                            child: Text(
                              isTeacher ? s.teacher : s.student,
                              style:
                                  Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: MyColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            10.sbw,
            Image.asset(
              Assets.assetsImagesLogo,
              width: 35.sp,
            ),
          ],
        ),
        30.sbh,
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
                    color: isSelected ? MyColors.white : MyColors.white,
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
                          color: isSelected ? MyColors.primary : Colors.blueGrey,
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
