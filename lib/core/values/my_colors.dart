import 'package:flutter/material.dart';

class MyColors {
  // ─── Light Theme ───────────────────────────────────────────────
  static const Color primary = Color(0xffFBDD66);
  static const Color primaryLight = Color(0xffFFF4C9);
  static const Color primaryDark = Color(0xffF0C64F);
  static const Color gold = Color(0xfff99711);
  static const Color secondary = Color(0xffEE3A4C);
  static const Color grey = Color(0xffE8E8E8);
  static const Color blue = Color(0xff4F81BD);
  static const Color white =Colors.white;
  static const Color black = Color.fromARGB(156, 8, 5, 5);
  static const Color myBlack = Color.fromARGB(255, 85, 84, 84);
  static const Color myGrey = Color.fromARGB(255, 145, 144, 144);
  static const Color neutralBlack = Color.fromARGB(255, 1, 1, 1);
  static const Color primaryMoreDark = Color.fromARGB(255, 252, 190, 21);

  // Additional light theme colors
  static const Color primaryAccent = Color(0xff456882);
  static const Color backGroundColor = Color(0xffFFFEFB);
  static const Color myBrown = Color(0xff7B4019);
  static const Color beige = Color(0xffFFFCF8);
  static const Color beige2 = Color(0xffFFF8E8);
  static const Color descriptionColor = Color(0xFFEDEDED);
  static const Color inputBorder = Color.fromRGBO(224, 224, 224, 1);

  // ─── Dark Theme ────────────────────────────────────────────────
  /// Main canvas — dark background matching the warmth of the app
  static const Color darkBackground = Color(0xFF0F1923); // Warm dark brown-black

  /// Cards, sheets, dialogs — slightly lighter than background
  static const Color darkSurface = Color(0xFF26201A); // Warm dark surface

  /// Elevated cards / bottom sheets
  static const Color darkCard = Color(0xFF1A2A4A); // Warmer elevated surface

  /// Primary — keeping the yellow/gold theme for dark mode (adjusted for visibility)
  static const Color darkPrimary = Color(0xFFFDDB5C); // Slightly brighter yellow for dark bg

  /// Secondary — keeping the red/pink theme for dark mode
  static const Color darkSecondary = Color(0xFFFF5C6B); // Brighter red for dark bg

  /// Gold accent matching your app's gold color
  static const Color darkGold = Color(0xFFF9B84A); // Brighter gold for dark bg

  /// Blue accent matching your app's blue color
  static const Color darkBlue = Color(0xFF6B9FDB); // Lighter blue for dark bg

  /// Body text on dark backgrounds — off-white for better readability
  static const Color darkText = Color(0xFFF0EDE8); // Warm off-white

  /// Secondary / muted text
  static const Color darkSubText = Color(0xFFA89F94); // Muted warm gray

  /// Divider lines
  static const Color darkDivider = Color(0xFF3A3128); // Warm divider

  /// Input field border
  static const Color darkInputBorder = Color(0xFF4A3F34); // Warm border

  /// Description / placeholder
  static const Color darkDescriptionColor = Color(0xFF7A6E60); // Muted warm gray

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