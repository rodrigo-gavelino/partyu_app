import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InitialConfig {
  InitialConfig();

  static Future<void> call() async  {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();


  }
  
}