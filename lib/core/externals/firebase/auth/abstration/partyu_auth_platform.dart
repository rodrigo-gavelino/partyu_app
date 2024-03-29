import 'package:firebase_auth/firebase_auth.dart';

import 'partyu_auth_platform_interface.dart';

class PartyuAuth {
  PartyuAuth._();

  static final PartyuAuthPlatform _instance = PartyuAuthPlatform.instance;

  static Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _instance.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
