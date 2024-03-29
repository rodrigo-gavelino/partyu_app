import 'package:flutter/material.dart';
import 'package:partyu/core/routes/partyu_routes.dart';

import 'feaures/splash/core_splash/routes/splash_named_routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PartyU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
      ),
      initialRoute: SplashNamedRoutes.splash,
      routes: PartyuRoutes.getPartyuRoutes(),
    );
  }
}
