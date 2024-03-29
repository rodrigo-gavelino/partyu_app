import 'package:firebase_auth/firebase_auth.dart';
import 'package:partyu/core/externals/firebase/auth/abstration/partyu_auth_platform_interface.dart';

abstract interface class SignInWithEmailAndPassword {
  Future<UserCredential> call({
    required String email,
    required String password,
  });
}

class SignInWithEmailAndPasswordImpl implements SignInWithEmailAndPassword {
  final PartyuAuthPlatform _partyuAuthPlatform;

  SignInWithEmailAndPasswordImpl(
      {required PartyuAuthPlatform partyuAuthPlatform})
      : _partyuAuthPlatform = partyuAuthPlatform;

  @override
  Future<UserCredential> call(
      {required String email, required String password}) {
    return _partyuAuthPlatform.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
