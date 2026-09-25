import 'package:flutter/material.dart';

class MyColors {
  // ─── Palette Colors (3 blue shades only) ──────────────────────
  static const Color blueDarkest  = Color(0xFF09315E); // darkest anchor
  static const Color blueLighter  = Color(0xFFB3D2EC); // mid / lighter
  static const Color blueLightest = Color(0xFFA5C5DB); // lightest tint

  // Legacy palette names → mapped to the 3 shades
  static const Color slateBlue = blueDarkest;   // was anchor navy
  static const Color softBlue  = blueLighter;   // was mid
  static const Color skyBlue   = blueLightest;  // was light tint
  static const Color offWhite  = Color(0xFFF4F8FB); // light canvas (neutral)

  // ─── Light Theme ───────────────────────────────────────────────
  static const Color primary         = blueDarkest;   // #09315E
  static const Color primaryLight    = blueLightest;  // #A5C5DB
  static const Color primaryDark     = blueDarkest;   // #09315E
  static const Color primaryMoreDark = blueDarkest;   // #09315E
  static const Color gold            = blueLighter;   // #3D80BB
  static const Color secondary       = blueLighter;   // #3D80BB
  static const Color grey            = Color(0xFFB7CBDE); // neutral blue-grey
  static const Color myGrey          = Colors.blueGrey;   // #3D80BB
  static const Color blue            = blueLighter;   // #3D80BB
  static const Color white           = Color(0xFFFFFFFF);
  static const Color black           = blueDarkest;   // #09315E
  static const Color myBlack         = blueDarkest;   // #09315E
  static const Color neutralBlack    = blueDarkest;   // #09315E

  // Additional light theme colors
  static const Color primaryAccent     = blueLighter;   // #3D80BB
  static const Color backGroundColor   = offWhite;      // #F4F8FB
  static const Color myBrown           = blueLighter;   // #3D80BB (repurposed)
  static const Color beige             = Color(0xFFEAF1F7);
  static const Color beige2            = Color(0xFFDCE7F1);
  static const Color descriptionColor  = Color(0xFFD2E0EC);
  static const Color inputBorder       = blueLightest;  // #A5C5DB

  // Utility Colors
  static const Color transparent = Color(0x00000000);
  static const Color red         = Color(0xFFE53935);
  static const Color green       = Color(0xFF4CAF50);
  static const Color lightGrey   = Color(0xFFDCE7F1);
  static const Color hintColor   = blueLightest; // #A5C5DB

  // ─── Dark Theme ────────────────────────────────────────────────
  /// Main canvas — deepest blue
  static const Color darkBackground = blueDarkest;   // #09315E

  /// Single surface color — also darkest (flat, single tone)
  static const Color darkSurface = blueDarkest;      // #09315E

  static const Color darkCard        = blueDarkest;
  static const Color darkDivider     = blueLighter;  // #3D80BB
  static const Color darkInputBorder = blueLighter;  // #3D80BB

  static const Color darkPrimary           = blueLightest; // #A5C5DB
  static const Color darkSecondary         = blueLighter;  // #3D80BB
  static const Color darkGold              = blueLighter;  // #3D80BB
  static const Color darkBlue              = blueLightest; // #A5C5DB
  static const Color darkText              = Color(0xFFFFFFFF);
  static const Color darkSubText           = blueLightest; // #A5C5DB
  static const Color darkDescriptionColor  = blueLightest; // #A5C5DB

  // ─── Adaptive helpers ──────────────────────────────────────────
  static Color adaptivePrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkPrimary : primary;

  static Color adaptiveSecondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkSecondary : secondary;

  static Color adaptiveGold(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkGold : gold;

  static Color adaptiveBlue(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkBlue : blue;

  static Color adaptiveBasic(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkBackground : white;

  static Color adaptiveInvertedBasic(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? white : darkBackground;

  static Color adaptiveSurface(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkSurface : backGroundColor;

  static Color adaptiveCard(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkCard : beige;

  static Color adaptiveBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkInputBorder : inputBorder;

  static Color adaptiveText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkText : myBlack;

  static Color adaptiveSubText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkSubText : myBlack;

  static Color adaptiveDisabled(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkSubText : myGrey;
}