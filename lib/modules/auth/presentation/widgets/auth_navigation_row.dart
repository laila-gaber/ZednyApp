import 'package:flutter/material.dart';

import '../../../../core/values/my_colors.dart';

class AuthNavigationRow extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;

  const AuthNavigationRow({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: MyColors.myGrey,
              ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MyColors.primary,
              fontWeight: FontWeight.bold
                ),
          ),
        ),
      ],
    );
  }
}
