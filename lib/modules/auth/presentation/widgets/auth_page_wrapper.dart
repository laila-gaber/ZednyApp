import 'package:flutter/material.dart';

import '../../../../core/values/my_colors.dart';

class AuthPageWrapper extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AuthPageWrapper({
    super.key,
    required this.child,
    this.backgroundColor = MyColors.offWhite,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: child,
          ),
        ),
      ),
    );
  }
}
