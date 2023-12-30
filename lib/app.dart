import 'package:Partyu/core/routes/partyu_routes.dart';
import 'package:Partyu/feaures/splash/splash_core/routes/splash_named_routes.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
     initialRoute: SplashNamedRoutes.splash,
      routes: PartyuRoutes.getPartyuRoutes(),
    );
  }
}
