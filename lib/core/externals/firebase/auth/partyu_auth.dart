import 'package:firebase_auth/firebase_auth.dart';

class PartyuAuth {
  final FirebaseAuth _firebaseAuth;

  PartyuAuth({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
