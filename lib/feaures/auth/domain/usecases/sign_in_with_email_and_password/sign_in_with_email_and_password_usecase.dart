import 'package:partyu/core/errors/failures/partyu_failures.dart';
import 'package:partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:partyu/core/utils/either.dart';
import 'package:partyu/feaures/auth/domain/entities/sign_in_with_email_and_password_response_entity.dart';

abstract interface class SignInWithEmailAndPasswordUsecase {
  Future<Either<PartyuFailures, SignInWithEmailAndPasswordResponseEntity>>
      call({
    required SignUpAndInParamsEntity signUpAndInParamsEntity,
  });
}
