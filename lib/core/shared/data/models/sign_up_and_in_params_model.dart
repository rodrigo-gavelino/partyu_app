import 'package:partyu/core/shared/data/model_objects/email_model.dart';
import 'package:partyu/core/shared/data/model_objects/password_model.dart';
import 'package:partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';

class SignUpAndInParamsModel extends SignUpAndInParamsEntity {
  final EmailModel emailModel;
  final PasswordModel passwordModel;

  SignUpAndInParamsModel({
    required this.emailModel,
    required this.passwordModel,
  }) : super(
          email: emailModel,
          password: passwordModel,
        );

  factory SignUpAndInParamsModel.fromEntity(SignUpAndInParamsEntity entity) {
    return SignUpAndInParamsModel(
      emailModel: EmailModel(entity.email.value),
      passwordModel: PasswordModel(entity.password.value),
    );
  }

  Map<String, String> toMap() {
    return {
      'email': emailModel.emailDTO,
      'password': passwordModel.passwordDTO,
    };
  }
}
