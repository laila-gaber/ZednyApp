import 'package:flutter/material.dart';

class MyColors {
  // ─── Palette Colors ───────────────────────────────────────────
  static const Color slateBlue = Color(0xFF355872); // #355872
  static const Color softBlue = Color(0xFF7AAACE);  // #7AAACE
  static const Color skyBlue = Color(0xFF9CD5FF);   // #9CD5FF
  static const Color offWhite = Color(0xFFF7F8F0);  // #F7F8F0

  // ─── Light Theme ───────────────────────────────────────────────
  static const Color primary = slateBlue;
  static const Color primaryLight = skyBlue;
  static const Color primaryDark = Color(0xFF264156);
  static const Color primaryMoreDark = Color(0xFF1B2F3E);
  static const Color gold = softBlue;
  static const Color secondary = softBlue;
  static const Color grey = Color(0xFFC3CBD2);
  static const Color myGrey = Color(0xFF6B7F90);
  static const Color blue = slateBlue;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1D2D3A);
  static const Color myBlack = Color(0xFF253746);
  static const Color neutralBlack = Color(0xFF0F1A22);

  // Additional light theme colors
  static const Color primaryAccent = softBlue;
  static const Color backGroundColor = offWhite;
  static const Color myBrown = Color(0xFF533B2B);
  static const Color beige = offWhite;
  static const Color beige2 = skyBlue;
  static const Color descriptionColor = Color(0xFFE5E8DD);
  static const Color inputBorder = Color(0xFFC3CBD2);

  // Utility Colors
  static const Color transparent = Color(0x00000000);
  static const Color red = Color(0xFFE53935);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color hintColor = Color(0xFFBBBBCC);

  // ─── Dark Theme ────────────────────────────────────────────────
  /// Main canvas — dark blue background derived from #355872
  static const Color darkBackground = Color(0xFF15222E);

  /// Cards, sheets, dialogs — slightly lighter dark surface
  static const Color darkSurface = Color(0xFF1E3040);

  /// Elevated cards / bottom sheets
  static const Color darkCard = Color(0xFF273E52);

  /// Primary — sky blue for high contrast on dark bg
  static const Color darkPrimary = skyBlue;

  /// Secondary — soft blue
  static const Color darkSecondary = softBlue;

  /// Accent / Gold equivalent
  static const Color darkGold = softBlue;

  /// Blue accent
  static const Color darkBlue = skyBlue;

  /// Body text on dark backgrounds — off-white
  static const Color darkText = offWhite;

  /// Secondary / muted text
  static const Color darkSubText = Color(0xFFA0B5C6);

  /// Divider lines
  static const Color darkDivider = Color(0xFF2C4357);

  /// Input field border
  static const Color darkInputBorder = Color(0xFF3B566E);

  /// Description / placeholder
  static const Color darkDescriptionColor = Color(0xFF7A93A8);

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
