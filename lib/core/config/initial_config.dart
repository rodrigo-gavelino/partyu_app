import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partyu/core/inject/partyu_inject.dart';
import 'package:partyu/firebase_options.dart';

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
