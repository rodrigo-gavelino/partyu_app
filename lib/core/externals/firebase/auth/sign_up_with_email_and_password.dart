import 'package:firebase_auth/firebase_auth.dart';
import 'package:partyu/core/externals/firebase/auth/abstration/partyu_auth_platform_interface.dart';

abstract interface class SignUpWithEmailAndPassword {
  Future<UserCredential> call({
    required String email,
    required String password,
  });
}

class SignUpWithEmailAndPasswordImpl implements SignUpWithEmailAndPassword {
  final PartyuAuthPlatform _partyuAuthPlatform;

  SignUpWithEmailAndPasswordImpl(
      {required PartyuAuthPlatform partyuAuthPlatform})
      : _partyuAuthPlatform = partyuAuthPlatform;

  @override
  Future<UserCredential> call(
      {required String email, required String password}) {
    return _partyuAuthPlatform.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
