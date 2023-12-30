import 'package:Partyu/feaures/splash/splash_core/routes/splash_routes.dart';
import 'package:flutter/material.dart';

class PartyuRoutes {
  static Map<String, Widget Function(BuildContext context)> getPartyuRoutes() {
    return {
      ...SplashRoutes.getSplashRoutes(),
    };
  }
}