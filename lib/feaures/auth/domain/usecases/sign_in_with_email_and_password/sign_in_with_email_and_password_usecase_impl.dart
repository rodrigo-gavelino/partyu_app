import 'package:partyu/core/errors/failures/partyu_failures.dart';
import 'package:partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:partyu/core/utils/either.dart';
import 'package:partyu/feaures/auth/domain/entities/sign_in_with_email_and_password_response_entity.dart';
import 'package:partyu/feaures/auth/domain/repositories/auth_repository.dart';
import 'package:partyu/feaures/auth/domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';

final class SignInWithEmailAndPasswordUsecaseImpl
    implements SignInWithEmailAndPasswordUsecase {
  final AuthRepository _authRespository;

  SignInWithEmailAndPasswordUsecaseImpl(
      {required AuthRepository authRepository})
      : _authRespository = authRepository;
  @override
  Future<Either<PartyuFailures, SignInWithEmailAndPasswordResponseEntity>>
      call({
    required SignUpAndInParamsEntity signUpAndInParamsEntity,
  }) async {
    return await _authRespository.signInWithEmailAndPassword(
      signUpAndInParamsEntity: signUpAndInParamsEntity,
    );
  }
}
