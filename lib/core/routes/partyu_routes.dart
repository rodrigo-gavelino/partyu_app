import 'package:Partyu/feaures/auth/core_auth/routes/auth_routes.dart';
import 'package:Partyu/feaures/splash/core_splash/routes/splash_routes.dart';
import 'package:flutter/material.dart';

class PartyuRoutes {
  static Map<String, Widget Function(BuildContext context)> getPartyuRoutes() {
    return {
      ...SplashRoutes.getSplashRoutes(),
      ...AuthRoutes.getAuthRoutes(),
    };
  }
}
