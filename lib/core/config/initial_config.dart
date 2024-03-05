import 'package:Partyu/core/inject/partyu_inject.dart';
import 'package:Partyu/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InitialConfig {
  InitialConfig();

  static Future<void> call() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await PartyuInject.call(getIt);
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
