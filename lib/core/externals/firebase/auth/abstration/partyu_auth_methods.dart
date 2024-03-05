import 'package:Partyu/core/externals/firebase/auth/abstration/partyu_auth_platform_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PartyuAuthMethods extends PartyuAuthPlatform {
  final FirebaseAuth _firebaseAuth;

  PartyuAuthMethods({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      {required String email, required String password}) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
