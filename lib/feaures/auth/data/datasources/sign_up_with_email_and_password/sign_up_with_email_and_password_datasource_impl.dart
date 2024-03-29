import 'package:firebase_auth/firebase_auth.dart';
import 'package:partyu/core/externals/firebase/auth/sign_up_with_email_and_password.dart';
import 'package:partyu/core/shared/data/models/sign_up_and_in_params_model.dart';
import 'package:partyu/feaures/auth/core_auth/auth_errors/auth_exceptions.dart';
import 'package:partyu/feaures/auth/data/datasources/sign_up_with_email_and_password/sign_up_with_email_and_password_datasource.dart';
import 'package:partyu/feaures/auth/data/models/sign_up_with_email_and_password_response_model.dart';

final class SignUpWithEmailAndPasswordDatasourceImpl
    implements SignUpWithEmailAndPasswordDatasource {
  final SignUpWithEmailAndPassword _signUpWithEmailAndPassword;

  SignUpWithEmailAndPasswordDatasourceImpl({
    required SignUpWithEmailAndPassword signUpWithEmailAndPassword,
  }) : _signUpWithEmailAndPassword = signUpWithEmailAndPassword;
  @override
  Future<SignUpWithEmailAndPasswordResponseModel> call({
    required SignUpAndInParamsModel signUpAndInParamsModel,
  }) async {
    try {
      final response = await _signUpWithEmailAndPassword(
        email: signUpAndInParamsModel.emailModel.emailDTO,
        password: signUpAndInParamsModel.passwordModel.passwordDTO,
      );
      return SignUpWithEmailAndPasswordResponseModel.fromCredentials(
          uid: response.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordException(
        code: e.code,
        message: e.message!,
        stackTrace: e.stackTrace,
      );
    }
  }
}
