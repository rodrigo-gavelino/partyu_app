import 'package:Partyu/core/externals/firebase/auth/sign_in_with_email_and_password.dart';
import 'package:Partyu/core/shared/data/models/sign_up_and_in_params_model.dart';
import 'package:Partyu/feaures/auth/core_auth/auth_errors/auth_exceptions.dart';
import 'package:Partyu/feaures/auth/data/datasources/sign_in_with_email_and_password/sign_in_with_email_and_password_datasource.dart';
import 'package:Partyu/feaures/auth/data/models/sign_in_with_email_and_password_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithEmailAndPasswordDataSourceImpl
    implements SignInWithEmailAndPasswordDatasource {
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;

  SignInWithEmailAndPasswordDataSourceImpl(
      {required SignInWithEmailAndPassword signInWithEmailAndPassword})
      : _signInWithEmailAndPassword = signInWithEmailAndPassword;
  @override
  Future<SignInWithEmailAndPasswordResponseModel> call(
      {required SignUpAndInParamsModel signUpAndInParamsModel}) async {
    try {
      final response = await _signInWithEmailAndPassword(
        email: signUpAndInParamsModel.emailModel.emailDTO,
        password: signUpAndInParamsModel.passwordModel.passwordDTO,
      );
      return SignInWithEmailAndPasswordResponseModel.fromCredentials(
        uid: response.user!.uid,
        displayName: response.user!.displayName!,
        email: response.user!.email!,
        photoURL: response.user!.photoURL!,
        expiresIn: response.user!.metadata.creationTime.toString(),
        refreshToken: response.user!.refreshToken!,
        idToken: response.user!.getIdToken().toString(),
      );
    } on FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordException(
        code: e.code,
        message: e.message!,
        stackTrace: e.stackTrace,
      );
    }
  }
}
