import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/components/toast_manager.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/student_user_dto.dart';
import 'student_details_sheet.dart';

class StudentItemCard extends StatelessWidget {
  final StudentUserDto student;

  const StudentItemCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final profile = student.profile;
    final name = profile?.name ?? s.noDataYet;
    final phone = profile?.phone ?? '-';
    final parentPhone = profile?.parentPhone ?? '-';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'S';

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: MyColors.transparent,
          builder: (_) => StudentDetailsSheet(student: student),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: MyColors.inputBorder.withValues(alpha: 0.6),
          ),
          boxShadow: [
            BoxShadow(
              color: MyColors.myGrey.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [MyColors.primary, MyColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: MyColors.primary.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                initial,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyColors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            14.sbw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyColors.myBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  6.sbh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.phone_android,
                        size: 14,
                        color: MyColors.myGrey,
                      ),
                      4.sbw,
                      Text(
                        phone,
                        style:
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: MyColors.myGrey,
                                ),
                      ),
                    ],
                  ),
                  if (parentPhone.isNotEmpty && parentPhone != '-') ...[
                    4.sbh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${s.parentPhone}: $parentPhone',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: MyColors.myGrey,
                              ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            12.sbw,
            InkWell(
              onTap: () {
                if (phone.isNotEmpty && phone != '-') {
                  Clipboard.setData(ClipboardData(text: phone));
                  ToastManager.showSuccess(s.phoneCopied);
                }
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyColors.skyBlue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.copy_rounded,
                  size: 20,
                  color: MyColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
