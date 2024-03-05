import 'package:Partyu/core/shared/data/models/sign_up_and_in_params_model.dart';
import 'package:Partyu/feaures/auth/data/models/sign_in_with_email_and_password_response_model.dart';

abstract interface class SignInWithEmailAndPasswordDatasource {
  Future<SignInWithEmailAndPasswordResponseModel> call({
    required SignUpAndInParamsModel signUpAndInParamsModel,
  });
}
