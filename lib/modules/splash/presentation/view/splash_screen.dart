import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      final token = sharedPrefs.getString("token");
      final targetRoute = token == null ? AppRoutes.login : AppRoutes.home;
      Navigator.of(context).pushReplacementNamed(targetRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: const Duration(milliseconds: 1200),
              child: Assets.images.logo.image(
                width: 180,
                height: 180,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.school,
                    size: 100,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
