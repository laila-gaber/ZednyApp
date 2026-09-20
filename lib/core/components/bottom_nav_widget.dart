/*
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zedny_app/core/extension/extensions.dart';
import 'package:zedny_app/core/widgets/login_required_widget.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:zedny_app/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/Utilities.dart';
import '../values/my_colors.dart';
import 'misc.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({super.key});

  final PersistentTabController _tabController =
  PersistentTabController(initialIndex: 0);

  static const double _navHeight = 64;
  static const double _fabSize = 58;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: Builder(
        builder: (context) {
          return PersistentTabView(
            controller: _tabController,
            backgroundColor: MyColors.adaptiveSurface(context),
            tabs: [
              PersistentTabConfig(
                screen: const HomePage(),
                item: ItemConfig(
                  icon: const _NavIcon(icon: Icons.home_rounded),
                  inactiveIcon:
                  const _NavIcon(icon: Icons.home_outlined, active: false),
                  title: S.of(context).home,
                  textStyle: Theme.of(context).textTheme.displaySmall!,
                  activeForegroundColor: MyColors.primaryMoreDark,
                  inactiveForegroundColor: MyColors.neutralBlack,
                ),
              ),
              PersistentTabConfig(
                screen: const StoresView(),
                item: ItemConfig(
                  icon: const _NavIcon(icon: Icons.storefront_rounded),
                  inactiveIcon: const _NavIcon(
                      icon: Icons.storefront_outlined, active: false),
                  activeForegroundColor: MyColors.primaryMoreDark,
                  inactiveForegroundColor: MyColors.neutralBlack,
                  title: S.of(context).stores,
                  textStyle: Theme.of(context).textTheme.displaySmall!,
                ),
              ),
              PersistentTabConfig(
                screen: const SizedBox.shrink(), // Empty screen for FAB tab
                item: ItemConfig(
                  icon: const SizedBox.shrink(),
                  title: '',
                  textStyle: const TextStyle(fontSize: 0),
                ),
              ),
              PersistentTabConfig(
                screen: Misc.isLoggedIn
                    ? const CheckoutView(fromHome: true)
                    : const LoginRequiredView(),
                item: ItemConfig(
                  icon: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) => _NavIcon(
                      icon: Icons.shopping_cart_rounded,
                      badgeCount: state.bagCount,
                    ),
                  ),
                  inactiveIcon: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) => _NavIcon(
                      icon: Icons.shopping_cart_outlined,
                      active: false,
                      badgeCount: state.bagCount,
                    ),
                  ),
                  activeForegroundColor: MyColors.primaryMoreDark,
                  inactiveForegroundColor: MyColors.neutralBlack,
                  title: S.of(context).cart,
                  textStyle: Theme.of(context).textTheme.displaySmall!,
                ),
              ),
              PersistentTabConfig(
                screen: const MoreView(),
                item: ItemConfig(
                  icon: const _NavIcon(icon: Icons.menu_open_rounded),
                  inactiveIcon:
                  const _NavIcon(icon: Icons.menu_outlined, active: false),
                  title: S.of(context).more,
                  activeForegroundColor: MyColors.primaryMoreDark,
                  inactiveForegroundColor: MyColors.neutralBlack,
                  textStyle: Theme.of(context).textTheme.displaySmall!,
                ),
              ),
            ],
            navBarBuilder: (navBarConfig) => _FloatingGlassNavBar(
              navBarConfig: navBarConfig,
              navHeight: _navHeight,
              fabGap: _fabSize,
            ),
            floatingActionButton: _ScanFab(
              size: _fabSize,
              navBarHeight: _navHeight,
              onTap: () {
                _tabController.jumpToTab(2);
                context.read<HomeCubit>().changeTab(2);
              },
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            onTabChanged: (index) {
              if (index == 2) return;

              if (index == 3 && Misc.isLoggedIn == false) {
                showLoginRequiredPopup(context,
                    featureName: S.of(context).cartFeature);
                return;
              } else if (index == 3) {
                context.read<CartCubit>().fetchCheckout();
              }
              context.read<HomeCubit>().changeTab(index);
            },
            hideNavigationBar: false,
            screenTransitionAnimation: const ScreenTransitionAnimation(
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: 300),
            ),
          );
        }
      ),
    );
  }
}

class _FloatingGlassNavBar extends StatelessWidget {
  const _FloatingGlassNavBar({
    required this.navBarConfig,
    required this.navHeight,
    required this.fabGap,
  });

  final NavBarConfig navBarConfig;
  final double navHeight;
  final double fabGap;

  @override
  Widget build(BuildContext context) {
    final items = navBarConfig.items;
    final selectedIndex = navBarConfig.selectedIndex;

    return Padding(
      padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, MediaQuery.of(context).viewPadding.bottom),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: navHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.myOpacity(0.75),
                  Colors.white.myOpacity(0.55),
                ],
              ),
              border: Border.all(
                color: Colors.white.myOpacity(0.6),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.myOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: _NavTabButton(
                    item: items[0],
                    selected: selectedIndex == 0,
                    onTap: () => navBarConfig.onItemSelected(0),
                  ),
                ),
                Expanded(
                  child: _NavTabButton(
                    item: items[1],
                    selected: selectedIndex == 1,
                    onTap: () => navBarConfig.onItemSelected(1),
                  ),
                ),
                SizedBox(width: fabGap),
                Expanded(
                  child: _NavTabButton(
                    item: items[3],
                    selected: selectedIndex == 3,
                    onTap: () => navBarConfig.onItemSelected(3),
                  ),
                ),
                Expanded(
                  child: _NavTabButton(
                    item: items[4],
                    selected: selectedIndex == 4,
                    onTap: () => navBarConfig.onItemSelected(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavTabButton extends StatelessWidget {
  const _NavTabButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final ItemConfig item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected
              ? MyColors.primaryDark.myOpacity(0.12)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: selected ? 1.12 : 1.0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              child: selected ? item.icon : (item.inactiveIcon ?? item.icon),
            ),
            const SizedBox(height: 2),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: (item.textStyle ?? const TextStyle()).copyWith(
                fontSize: 10.5,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected
                    ? (item.activeForegroundColor ?? MyColors.primaryMoreDark)
                    : (item.inactiveForegroundColor ?? Colors.grey.shade500),
              ),
              child: Text(
                item.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanFab extends StatefulWidget {
  const _ScanFab({
    required this.size,
    required this.navBarHeight,
    required this.onTap,
  });

  final double size;
  final double navBarHeight;
  final VoidCallback onTap;

  @override
  State<_ScanFab> createState() => _ScanFabState();
}

class _ScanFabState extends State<_ScanFab> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final offset = (widget.navBarHeight / 1) - (widget.size / 1) - 10;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: Transform.translate(
        offset: Offset(0, -offset),
        child: AnimatedScale(
          scale: _pressed ? 0.92 : 1.0,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [MyColors.primaryDark, MyColors.primaryMoreDark],
              ),
              boxShadow: [
                BoxShadow(
                  color: MyColors.primaryDark.myOpacity(0.4),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.document_scanner_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    this.active = true,
    this.badgeCount = 0,
  });

  final IconData icon;
  final bool active;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      size: 24,
      color: active ? MyColors.primaryMoreDark : MyColors.neutralBlack,
    );

    if (badgeCount == 0) {
      return iconWidget;
    }

    return Badge(
      backgroundColor: MyColors.secondary,
      largeSize: 16,
      label: Bounce(
        key: ValueKey(badgeCount),
        duration: const Duration(milliseconds: 350),
        child: Text(
          badgeCount.toString(),
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: iconWidget,
    );
  }
}
*/
