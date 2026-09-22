import 'package:flutter/material.dart';

import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: MyColors.primaryDark,
        boxShadow: [
          BoxShadow(
            color: MyColors.transparent,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: MyColors.primaryDark,
        selectedItemColor: MyColors.softBlue,
        unselectedItemColor: MyColors.myGrey,
        selectedLabelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: MyColors.softBlue,
              fontWeight: FontWeight.bold,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: MyColors.myGrey,
            ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: s.content,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people_outline),
            activeIcon: const Icon(Icons.people),
            label: s.students,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.code_outlined),
            activeIcon: const Icon(Icons.code),
            label: s.codes,
          ),
        ],
      ),
    );
  }
}
