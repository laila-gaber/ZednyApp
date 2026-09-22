import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import 'stat_card.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({super.key});

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
        top: 20,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: MyColors.softBlue,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  'م',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyColors.primaryDark,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    s.dashboard,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyColors.descriptionColor,
                        ),
                  ),
                  2.sbh,
                  Text(
                    s.teacherName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: MyColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
          24.sbh,
          Row(
            children: [
              Expanded(
                child: StatCard(
                  value: '3',
                  label: s.pendingWarnings,
                ),
              ),
              12.sbw,
              Expanded(
                child: StatCard(
                  value: '19',
                  label: s.lectures,
                ),
              ),
              12.sbw,
              Expanded(
                child: StatCard(
                  value: '142',
                  label: s.registeredStudents,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
