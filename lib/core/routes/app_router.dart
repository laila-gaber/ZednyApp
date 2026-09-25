import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zedny_app/modules/home/data/repo/home_repository.dart';
import 'package:zedny_app/modules/home/services/home_service.dart';
import 'package:zedny_app/modules/home/services/home_service_iml.dart';

import '../../modules/auth/data/repo/repository.dart';
import '../../modules/auth/presentation/cubit/auth_cubit.dart';
import '../../modules/auth/presentation/view/login_screen.dart';
import '../../modules/auth/presentation/view/register_screen.dart';
import '../../modules/auth/services/auth_service_iml.dart';
import '../../modules/home/presentation/cubit/home_cubit.dart';
import '../../modules/home/presentation/view/home_screen.dart';
import '../../modules/splash/presentation/view/splash_screen.dart';
import '../../modules/students/data/repo/student_repository.dart';
import '../../modules/students/presentation/cubit/student_cubit.dart';
import '../../modules/students/presentation/view/student_screen.dart';
import '../../modules/students/services/student_service_iml.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    HomeCubit(HomeServiceImpl(HomeRepo()))/*..initData()*/,
              ),
              BlocProvider(
                create: (_) => StudentCubit(StudentServiceImpl(StudentRepo())),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.students:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                StudentCubit(StudentServiceImpl(StudentRepo())),
            child: const StudentScreen(),
          ),
        );
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
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text('Products View')),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Unknown Route'))),
        );
    }
  }
}
