import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'my_colors.dart';

class MyTheme {
  // ─── Font Family Helper ────────────────────────────────────────
  static String getFontFamily(BuildContext context) {
    return 'Cairo';
  }

  // ─── Shared text styles ────────────────────────────────────────
  static TextStyle errorField = TextStyle(color: MyColors.red, fontSize: 9.sp);

  static TextStyle subTitle = TextStyle(
    color: MyColors.primary,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
  );

  static TextStyle darkSubTitle = TextStyle(
    color: MyColors.darkBlue,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
  );

  // ─── Light TextTheme ───────────────────────────────────────────
  static TextTheme textTheme() => TextTheme(
        headlineLarge: TextStyle(
          color: MyColors.blue,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        headlineMedium: TextStyle(
          color: MyColors.blue,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        headlineSmall: TextStyle(
          color: MyColors.blue,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        titleLarge: TextStyle(
          color: MyColors.blue,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        titleMedium: TextStyle(
          color: MyColors.blue,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        titleSmall: TextStyle(
          color: MyColors.blue,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        labelLarge: TextStyle(
          color: MyColors.myBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
        labelMedium: TextStyle(
          color: MyColors.myBlack,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
        labelSmall: TextStyle(
          color: MyColors.myBlack,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
        bodyLarge: TextStyle(
          color: MyColors.myGrey,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'Cairo',
        ),
        bodyMedium: TextStyle(
          color: MyColors.myGrey,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'Cairo',
        ),
        bodySmall: TextStyle(
          color: MyColors.myGrey,
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          height: 1.33,
          fontFamily: 'Cairo',
        ),
        displayLarge: TextStyle(
            color: MyColors.myBlack,
            fontSize: 12.sp,
            height: 1.5,
            fontFamily: 'Cairo',
            letterSpacing: 0.5),
        displayMedium: TextStyle(
            color: MyColors.myBlack,
            fontSize: 10.sp,
            height: 1.5,
            fontFamily: 'Cairo',
            letterSpacing: 0.5),
        displaySmall: TextStyle(
            color: MyColors.myBlack,
            fontSize: 8.sp,
            fontFamily: 'Cairo',
            letterSpacing: 0.5),
      );

  // ─── Dark TextTheme ────────────────────────────────────────────
  static TextTheme darkTextTheme() => TextTheme(
        headlineLarge: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        headlineMedium: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        headlineSmall: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        titleLarge: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 16.sp,
          fontFamily: 'Cairo',
        ),
        titleMedium: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 14.sp,
          fontFamily: 'Cairo',
        ),
        titleSmall: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 12.sp,
          fontFamily: 'Cairo',
        ),
        labelLarge: TextStyle(
          color: MyColors.darkText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
        labelMedium: TextStyle(
          color: MyColors.darkText,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
        labelSmall: TextStyle(
          color: MyColors.darkSubText,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
        bodyLarge: TextStyle(
          color: MyColors.darkSubText,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'Cairo',
        ),
        bodyMedium: TextStyle(
          color: MyColors.darkSubText,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'Cairo',
        ),
        bodySmall: TextStyle(
          color: MyColors.darkText,
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          height: 1.33,
          fontFamily: 'Cairo',
        ),
        displayLarge: TextStyle(
            color: MyColors.darkSubText,
            fontSize: 12.sp,
            height: 1.5,
            fontFamily: 'Cairo',
            letterSpacing: 0.5),
        displayMedium: TextStyle(
            color: MyColors.darkSubText,
            fontSize: 10.sp,
            height: 1.5,
            fontFamily: 'Cairo',
            letterSpacing: 0.5),
        displaySmall: TextStyle(
            color: MyColors.darkSubText,
            fontSize: 8.sp,
            fontFamily: 'Cairo',
            letterSpacing: 0.5),
      );

  // ─── Light AppBar ──────────────────────────────────────────────
  static AppBarTheme appBarTheme(BuildContext context, String? fontFamily) =>
      AppBarTheme(
        centerTitle: false,
        actionsIconTheme: const IconThemeData(size: 20),
        backgroundColor: MyColors.primary,
        iconTheme: const IconThemeData(color: MyColors.secondary),
        titleTextStyle: textTheme()
            .headlineMedium!
            .copyWith(fontFamily: 'Cairo', color: MyColors.white),
        elevation: 0,
        shadowColor: MyColors.transparent,
        surfaceTintColor: MyColors.transparent,
        scrolledUnderElevation: 0,
      );

  // ─── Dark AppBar ───────────────────────────────────────────────
  static AppBarTheme darkAppBarTheme(
          BuildContext context, String? fontFamily) =>
      AppBarTheme(
        scrolledUnderElevation: 0,
        centerTitle: false,
        actionsIconTheme: const IconThemeData(size: 20, color: MyColors.darkSecondary),
        backgroundColor: MyColors.darkSurface,
        elevation: 0,
        shadowColor: MyColors.transparent,
        surfaceTintColor: MyColors.transparent,

        iconTheme: const IconThemeData(color: MyColors.darkSecondary),
        titleTextStyle: darkTextTheme()
            .headlineMedium!
            .copyWith(fontFamily: 'Cairo', color: MyColors.darkText),
      );

  // ─── Light ElevatedButton ──────────────────────────────────────
  static ElevatedButtonThemeData elevatedButtonTheme() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary,
          textStyle: textTheme().titleLarge!.copyWith(
                color: MyColors.white,
                fontFamily: 'Cairo',
              ),
          foregroundColor: MyColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  // ─── Dark ElevatedButton ───────────────────────────────────────
  static ElevatedButtonThemeData darkElevatedButtonTheme() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.darkBlue,
          textStyle: darkTextTheme().titleLarge!.copyWith(
                color: MyColors.white,
                fontFamily: 'Cairo',
              ),
          foregroundColor: MyColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  // ─── Light Switch theme ────────────────────────────────────────
  static SwitchThemeData switchTheme() => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? MyColors.primary
              : MyColors.grey,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? MyColors.primary.withOpacity(0.35)
              : MyColors.lightGrey,
        ),
        trackOutlineColor: WidgetStateProperty.all(MyColors.transparent),
      );

  // ─── Dark Switch theme ─────────────────────────────────────────
  static SwitchThemeData darkSwitchTheme() => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? MyColors.darkBlue
              : MyColors.darkSubText,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? MyColors.darkBlue.withOpacity(0.35)
              : MyColors.darkCard,
        ),
        trackOutlineColor: WidgetStateProperty.all(MyColors.transparent),
      );
}
