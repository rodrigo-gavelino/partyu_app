import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partyu/feaures/splash/core_splash/routes/splash_named_routes.dart';
import 'package:partyu/feaures/splash/presenter/cubits/splash_cubit/splash_cubit.dart';
import 'package:partyu/feaures/splash/presenter/ui/pages/splash_page.dart';

class SplashRoutes {
  static Map<String, Widget Function(BuildContext context)> getSplashRoutes() {
    return {
      SplashNamedRoutes.splash: (context) => BlocProvider(
            create: (context) => SplashCubit(),
            child: const SplashPage(),
          ),
    };
  }
}
