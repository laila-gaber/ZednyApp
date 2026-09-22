import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: MyColors.primaryDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: MyColors.myGrey.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: MyColors.softBlue,
                  fontWeight: FontWeight.bold,
                ),
          ),
          4.sbh,
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: MyColors.descriptionColor,
                ),
          ),
        ],
      ),
    );
  }
}
