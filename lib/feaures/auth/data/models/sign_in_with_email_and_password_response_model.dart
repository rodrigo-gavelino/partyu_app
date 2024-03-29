import 'package:partyu/feaures/auth/domain/entities/sign_in_with_email_and_password_response_entity.dart';

class SignInWithEmailAndPasswordResponseModel
    extends SignInWithEmailAndPasswordResponseEntity {
  SignInWithEmailAndPasswordResponseModel({
    required super.uid,
    required super.email,
    required super.displayName,
    required super.photoURL,
    required super.expiresIn,
    required super.refreshToken,
    required super.idToken,
  });

  factory SignInWithEmailAndPasswordResponseModel.fromCredentials({
    required String uid,
    required String email,
    required String displayName,
    required String photoURL,
    required String expiresIn,
    required String refreshToken,
    required String idToken,
  }) {
    return SignInWithEmailAndPasswordResponseModel(
      uid: uid,
      email: email,
      displayName: displayName,
      photoURL: photoURL,
      expiresIn: expiresIn,
      refreshToken: refreshToken,
      idToken: idToken,
    );
  }

  factory SignInWithEmailAndPasswordResponseModel.fromEntity(
      SignInWithEmailAndPasswordResponseEntity entity) {
    return SignInWithEmailAndPasswordResponseModel(
      uid: entity.uid,
      email: entity.email,
      displayName: entity.displayName,
      photoURL: entity.photoURL,
      expiresIn: entity.expiresIn,
      refreshToken: entity.refreshToken,
      idToken: entity.idToken,
    );
  }
}
