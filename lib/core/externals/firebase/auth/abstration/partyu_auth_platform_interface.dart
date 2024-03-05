import 'package:Partyu/core/externals/firebase/auth/abstration/partyu_auth_methods.dart';
import 'package:Partyu/core/inject/partyu_inject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

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
