import 'package:firebase_auth/firebase_auth.dart';
import 'package:partyu/core/inject/partyu_inject.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'partyu_auth_methods.dart';

abstract class PartyuAuthPlatform extends PlatformInterface {
  PartyuAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static PartyuAuthPlatform _instance = getIt.get<PartyuAuthMethods>();

  static PartyuAuthPlatform get instance => _instance;

  static set instance(PartyuAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
