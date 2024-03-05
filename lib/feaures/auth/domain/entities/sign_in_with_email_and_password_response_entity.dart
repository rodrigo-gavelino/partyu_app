class SignInWithEmailAndPasswordResponseEntity {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;
  final String idToken;
  final String refreshToken;
  final String expiresIn;

  SignInWithEmailAndPasswordResponseEntity({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
    required this.idToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInWithEmailAndPasswordResponseEntity &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          email == other.email &&
          displayName == other.displayName &&
          photoURL == other.photoURL &&
          idToken == other.idToken &&
          refreshToken == other.refreshToken &&
          expiresIn == other.expiresIn;

  @override
  int get hashCode =>
      uid.hashCode ^
      email.hashCode ^
      displayName.hashCode ^
      photoURL.hashCode ^
      idToken.hashCode ^
      refreshToken.hashCode ^
      expiresIn.hashCode;
}
