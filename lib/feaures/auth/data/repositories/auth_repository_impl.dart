import 'package:Partyu/core/errors/failures/partyu_failures.dart';
import 'package:Partyu/core/shared/data/models/sign_up_and_in_params_model.dart';
import 'package:Partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:Partyu/core/utils/either.dart';
import 'package:Partyu/feaures/auth/core_auth/auth_errors/auth_exceptions.dart';
import 'package:Partyu/feaures/auth/core_auth/auth_errors/auth_failures.dart';
import 'package:Partyu/feaures/auth/data/datasources/sign_in_with_email_and_password/sign_in_with_email_and_password_datasource.dart';
import 'package:Partyu/feaures/auth/data/datasources/sign_up_with_email_and_password/sign_up_with_email_and_password_datasource.dart';
import 'package:Partyu/feaures/auth/data/models/sign_in_with_email_and_password_response_model.dart';
import 'package:Partyu/feaures/auth/data/models/sign_up_with_email_and_password_response_model.dart';
import 'package:Partyu/feaures/auth/domain/entities/sign_in_with_email_and_password_response_entity.dart';
import 'package:Partyu/feaures/auth/domain/entities/sign_up_with_email_and_password_response_entity.dart';
import 'package:Partyu/feaures/auth/domain/repositories/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final SignUpWithEmailAndPasswordDatasource
      _signUpWithEmailAndPasswordDatasource;
  final SignInWithEmailAndPasswordDatasource
      _signInWithEmailAndPasswordDatasource;

  AuthRepositoryImpl({
    required SignUpWithEmailAndPasswordDatasource
        signUpWithEmailAndPasswordDatasource,
    required SignInWithEmailAndPasswordDatasource
        signInWithEmailAndPasswordDatasource,
  })  : _signUpWithEmailAndPasswordDatasource =
            signUpWithEmailAndPasswordDatasource,
        _signInWithEmailAndPasswordDatasource =
            signInWithEmailAndPasswordDatasource;
  @override
  Future<Either<PartyuFailures, SignUpWithEmailAndPasswordResponseEntity>>
      signUpWithEmailAndPassword({
    required SignUpAndInParamsEntity signUpAndInParamsEntity,
  }) async {
    try {
      final result = await _signUpWithEmailAndPasswordDatasource(
        signUpAndInParamsModel:
            SignUpAndInParamsModel.fromEntity(signUpAndInParamsEntity),
      );
      return Right(SignUpWithEmailAndPasswordResponseModel.fromEntity(result));
    } on SignUpWithEmailAndPasswordException catch (e) {
      return Left(
        SignUpWithEmailAndPasswordFailure(
          code: e.code,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<PartyuFailures, SignInWithEmailAndPasswordResponseEntity>>
      signInWithEmailAndPassword({
    required SignUpAndInParamsEntity signUpAndInParamsEntity,
  }) async {
    try {
      final result = await _signInWithEmailAndPasswordDatasource(
        signUpAndInParamsModel:
            SignUpAndInParamsModel.fromEntity(signUpAndInParamsEntity),
      );
      return Right(SignInWithEmailAndPasswordResponseModel.fromEntity(result));
    } on SignInWithEmailAndPasswordException catch (e) {
      return Left(
        SignInWithEmailAndPasswordFailure(
          code: e.code,
          message: e.message,
        ),
      );
    }
  }
}
