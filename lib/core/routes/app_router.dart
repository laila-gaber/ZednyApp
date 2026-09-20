import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/auth/data/repo/repository.dart';
import '../../modules/auth/presentation/cubit/auth_cubit.dart';
import '../../modules/auth/presentation/view/login_screen.dart';
import '../../modules/auth/presentation/view/register_screen.dart';
import '../../modules/auth/presentation/view/otp_verification_screen.dart';
import '../../modules/auth/services/auth_service_iml.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => const Center(child: Text('Home Screen')));
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(AuthServiceImpl(AuthRepo())),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(AuthServiceImpl(AuthRepo())),
            child: const RegisterScreen(),
          ),
        );
      case AppRoutes.productsView:
        // Handle other routes or provide placeholders
        return MaterialPageRoute(
            builder: (_) => const Center(child: Text('Products View')));
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Unknown Route')),
          ),
        );
    }
  }
}
