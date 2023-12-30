import 'package:Partyu/core/errors/failures/partyu_failures.dart';
import 'package:Partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:Partyu/core/utils/either.dart';
import 'package:Partyu/feaures/auth/domain/entities/sign_up_with_email_and_password_response_entity.dart';
import 'package:Partyu/feaures/auth/domain/repositories/auth_repository.dart';

import 'sign_up_with_email_and_password_usecase.dart';

class SignUpWithEmailAndPasswordUsecaseImpl
    implements SignUpWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;

  SignUpWithEmailAndPasswordUsecaseImpl(
      {required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<PartyuFailures, SignUpWithEmailAndPasswordResponseEntity>>
      call({
    required SignUpAndInParamsEntity signUpAndInParamsEntity,
  }) async {
    return await _authRepository.signUpWithEmailAndPassword(
      signUpAndInParamsEntity: signUpAndInParamsEntity,
    );
  }
}
