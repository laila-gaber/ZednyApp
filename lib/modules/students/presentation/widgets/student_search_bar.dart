import 'package:flutter/material.dart';

import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';

class StudentSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const StudentSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColors.myGrey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: MyColors.myBlack,
            ),
        decoration: InputDecoration(
          hintText: s.searchStudentHint,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: MyColors.myGrey,
              ),
          prefixIcon: const Icon(
            Icons.search,
            color: MyColors.primary,
          ),
          filled: true,
          fillColor: MyColors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: MyColors.softBlue,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
