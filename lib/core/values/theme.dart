import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'my_colors.dart';

class MyTheme {
  static const String fontFamily = 'schehrazad';

  static String getFontFamily(BuildContext context) {
    return fontFamily;
  }

  // ─── Shared text styles ────────────────────────────────────────
  static TextStyle errorField = TextStyle(
    color: MyColors.red,
    fontSize: 15.sp,
    fontFamily: fontFamily,
  );

  static TextStyle subTitle = TextStyle(
    color: MyColors.primary,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle darkSubTitle = TextStyle(
    color: MyColors.darkBlue,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  // ─── Light TextTheme ───────────────────────────────────────────
  static TextTheme textTheme() => TextTheme(
        // Bold Styles
        headlineLarge: TextStyle(
          color: MyColors.blue,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          height: 1.25,
        ),
        headlineMedium: TextStyle(
          color: MyColors.blue,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          height: 1.3,
        ),
        headlineSmall: TextStyle(
          color: MyColors.blue,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        titleLarge: TextStyle(
          color: MyColors.myBlack,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),

        // Medium Styles
        titleMedium: TextStyle(
          color: MyColors.myBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        titleSmall: TextStyle(
          color: MyColors.myBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelLarge: TextStyle(
          color: MyColors.myBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelMedium: TextStyle(
          color: MyColors.myBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelSmall: TextStyle(
          color: MyColors.myGrey,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),

        // Regular Styles
        bodyLarge: TextStyle(
          color: MyColors.myBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          color: MyColors.myBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          color: MyColors.myGrey,
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
        ),
      );

  // ─── Dark TextTheme ────────────────────────────────────────────
  static TextTheme darkTextTheme() => TextTheme(
        // Bold Styles
        headlineLarge: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          height: 1.25,
        ),
        headlineMedium: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          height: 1.3,
        ),
        headlineSmall: TextStyle(
          color: MyColors.darkBlue,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        titleLarge: TextStyle(
          color: MyColors.darkText,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),

        // Medium Styles
        titleMedium: TextStyle(
          color: MyColors.darkText,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        titleSmall: TextStyle(
          color: MyColors.darkText,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelLarge: TextStyle(
          color: MyColors.darkText,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelMedium: TextStyle(
          color: MyColors.darkText,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelSmall: TextStyle(
          color: MyColors.darkSubText,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),

        // Regular Styles
        bodyLarge: TextStyle(
          color: MyColors.darkText,
          fontSize: 20.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          color: MyColors.darkSubText,
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          color: MyColors.darkSubText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
        ),
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
            .copyWith(fontFamily: MyTheme.fontFamily, color: MyColors.white),
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
            .copyWith(fontFamily: MyTheme.fontFamily, color: MyColors.darkText),
      );

  // ─── Light ElevatedButton ──────────────────────────────────────
  static ElevatedButtonThemeData elevatedButtonTheme() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary,
          textStyle: textTheme().titleLarge!.copyWith(
                color: MyColors.white,
                fontFamily: MyTheme.fontFamily,
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
                fontFamily: MyTheme.fontFamily,
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
              ? MyColors.primary.withValues(alpha: 0.35)
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
              ? MyColors.darkBlue.withValues(alpha: 0.35)
              : MyColors.darkCard,
        ),
        trackOutlineColor: WidgetStateProperty.all(MyColors.transparent),
      );
}
