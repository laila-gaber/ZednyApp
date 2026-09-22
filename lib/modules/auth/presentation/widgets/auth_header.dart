import 'package:flutter/material.dart';

import '../../../../core/values/my_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AuthHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBackButton)
          GestureDetector(
            onTap: onBackPressed ?? () => Navigator.pop(context),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: MyColors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: MyColors.blue,
                size: 20,
              ),
            ),
          ),
        const SizedBox(height: 24),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                 // color: MyColors.myGrey,
                ),
          ),
        ],
      ],
    );
  }
}
