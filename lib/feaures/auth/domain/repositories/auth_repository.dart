import 'package:partyu/core/errors/failures/partyu_failures.dart';
import 'package:partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:partyu/core/utils/either.dart';
import 'package:partyu/feaures/auth/domain/entities/sign_in_with_email_and_password_response_entity.dart';
import 'package:partyu/feaures/auth/domain/entities/sign_up_with_email_and_password_response_entity.dart';

abstract interface class AuthRepository {
  Future<Either<PartyuFailures, SignUpWithEmailAndPasswordResponseEntity>>
      signUpWithEmailAndPassword({
    required SignUpAndInParamsEntity signUpAndInParamsEntity,
  });

  Future<Either<PartyuFailures, SignInWithEmailAndPasswordResponseEntity>>
      signInWithEmailAndPassword({
    required SignUpAndInParamsEntity signUpAndInParamsEntity,
  });
}
