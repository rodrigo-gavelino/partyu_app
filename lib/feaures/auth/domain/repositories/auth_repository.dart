import 'package:Partyu/core/errors/failures/partyu_failures.dart';
import 'package:Partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:Partyu/core/utils/either.dart';
import 'package:Partyu/feaures/auth/domain/entities/sign_up_with_email_and_password_response_entity.dart';

abstract interface class AuthRepository {
  Future<Either<PartyuFailures, SignUpWithEmailAndPasswordResponseEntity>>
      signUpWithEmailAndPassword(
          {required SignUpAndInParamsEntity signUpAndInParamsEntity});
}
