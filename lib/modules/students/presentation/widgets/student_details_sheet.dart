import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/student_user_dto.dart';

class StudentDetailsSheet extends StatelessWidget {
  final StudentUserDto student;

  const StudentDetailsSheet({
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
    final userType = student.userType ?? s.student;
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'S';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: MyColors.myGrey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          20.sbh,
          CircleAvatar(
            radius: 36,
            backgroundColor: MyColors.primary,
            child: Text(
              initial,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          12.sbh,
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: MyColors.myBlack,
                  fontWeight: FontWeight.bold,
                ),
          ),
          4.sbh,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: MyColors.skyBlue.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              userType,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          24.sbh,
          _buildInfoRow(
            context: context,
            icon: Icons.phone,
            label: s.phoneNumber,
            value: phone,
          ),
          12.sbh,
          _buildInfoRow(
            context: context,
            icon: Icons.family_restroom,
            label: s.parentPhone,
            value: parentPhone,
          ),
          if (student.ref != null) ...[
            12.sbh,
            _buildInfoRow(
              context: context,
              icon: Icons.badge,
              label: 'Ref',
              value: student.ref!,
            ),
          ],
          28.sbh,
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: MyColors.offWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: MyColors.inputBorder,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: MyColors.myBlack,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Row(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: MyColors.myGrey,
                    ),
              ),
              8.sbw,
              Icon(
                icon,
                size: 20,
                color: MyColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
