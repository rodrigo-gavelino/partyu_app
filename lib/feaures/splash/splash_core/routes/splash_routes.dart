import 'package:Partyu/feaures/splash/presenter/cubits/splash_cubit/splash_cubit.dart';
import 'package:Partyu/feaures/splash/presenter/ui/pages/splash_page.dart';
import 'package:Partyu/feaures/splash/splash_core/routes/splash_named_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
