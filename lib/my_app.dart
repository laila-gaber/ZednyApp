import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zedny_app/core/widgets/my_spinkit_loader.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';

import 'core/extension/extensions.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/values/my_colors.dart';
import 'core/values/theme.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.locale});
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    const fontFamily = MyTheme.fontFamily;

    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return Center(
          child: MyLoadingWidget(
            color: MyColors.secondary,
            size: 50.0,
          ),
        );
      },
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'زدني',
          debugShowCheckedModeBanner: false,

          // ── Dark Theme ───────────────────────────────────────
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: MyColors.darkSurface,
            cardTheme: CardThemeData(
                color: MyColors.darkCard
            ),
            fontFamily: fontFamily,

            dialogTheme: const DialogThemeData(
              backgroundColor: MyColors.darkSurface,
            ),

            textTheme: MyTheme.darkTextTheme(),
            appBarTheme: MyTheme.darkAppBarTheme(context, fontFamily),
            useMaterial3: true,
            elevatedButtonTheme: MyTheme.darkElevatedButtonTheme(),
            switchTheme: MyTheme.darkSwitchTheme(),

            colorScheme: const ColorScheme.dark(
              primary: MyColors.darkPrimary,
              secondary: MyColors.darkGold,
              surface: MyColors.darkSurface,
              onPrimary: MyColors.white,
              onSurface: MyColors.darkText,
            ),

            dividerTheme: const DividerThemeData(
              space: 8,
              indent: 1,
              thickness: 1,
              endIndent: 1,
              color: MyColors.darkDivider,
            ),

            primaryColor: MyColors.darkPrimary,
            iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
            ),

            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: MyColors.darkCard,
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.darkInputBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.darkPrimary, width: 2),
              ),
              hintStyle: TextStyle(color: MyColors.darkDescriptionColor),
              labelStyle: TextStyle(color: MyColors.darkSubText),
            ),

            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: MyColors.darkSurface,
              selectedItemColor: MyColors.darkPrimary,
              unselectedItemColor: MyColors.darkSubText,
            ),
          ),

          themeMode: (sharedPrefs.getBool('isDarkMode') ?? false)
              ? ThemeMode.dark
              : ThemeMode.light,

          theme: ThemeData(
            cardTheme: CardThemeData(
              color: MyColors.beige
            ),
            fontFamily: fontFamily,
            scaffoldBackgroundColor: MyColors.backGroundColor,
            dialogTheme: DialogThemeData(
              backgroundColor: MyColors.white,
            ),
            textTheme: MyTheme.textTheme(),
            appBarTheme: MyTheme.appBarTheme(context, fontFamily),
            useMaterial3: true,
            listTileTheme: const ListTileThemeData(
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            dividerTheme: DividerThemeData(
              space: 8,
              indent: 1,
              thickness: 1,
              endIndent: 1,
              color: MyColors.descriptionColor,
            ),
          ),
          locale: locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            double scaleFactor = 1;
            return ResponsiveSizer(builder: (context, orientation, deviceType) {
              return MediaQuery(
                data: data.copyWith(textScaler: TextScaler.linear(scaleFactor)),
                child: ResponsiveBreakpoints.builder(
                  child: SafeArea(
                      top: true,
                      child: child!),
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(
                      start: 1921,
                      end: double.infinity,
                      name: '4K',
                    ),
                  ],
                ),
              );
            });
          },
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: AppRouter.onGenerateRoutes,
          initialRoute: AppRoutes.splash,
        );
      }),
    );
  }
}
