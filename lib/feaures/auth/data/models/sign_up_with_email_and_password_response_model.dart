import 'package:Partyu/feaures/auth/domain/entities/sign_up_with_email_and_password_response_entity.dart';

class SignUpWithEmailAndPasswordResponseModel
    extends SignUpWithEmailAndPasswordResponseEntity {
  SignUpWithEmailAndPasswordResponseModel({
    required super.uid,
  });

  factory SignUpWithEmailAndPasswordResponseModel.fromCredentials(
      {required String uid}) {
    return SignUpWithEmailAndPasswordResponseModel(uid: uid);
  }

  factory SignUpWithEmailAndPasswordResponseModel.fromEntity(
      SignUpWithEmailAndPasswordResponseEntity entity) {
    return SignUpWithEmailAndPasswordResponseModel(uid: entity.uid);
  }
}
