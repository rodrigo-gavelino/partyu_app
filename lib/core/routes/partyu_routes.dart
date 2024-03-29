import 'package:flutter/material.dart';
import 'package:partyu/feaures/auth/core_auth/routes/auth_routes.dart';
import 'package:partyu/feaures/splash/core_splash/routes/splash_routes.dart';

class PartyuRoutes {
  static Map<String, Widget Function(BuildContext context)> getPartyuRoutes() {
    return {
      ...SplashRoutes.getSplashRoutes(),
      ...AuthRoutes.getAuthRoutes(),
    };
  }
}
