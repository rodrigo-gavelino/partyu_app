import 'package:Partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:Partyu/core/shared/domain/value_objects/email.dart';
import 'package:Partyu/core/shared/domain/value_objects/password.dart';
import 'package:Partyu/feaures/auth/domain/usecases/sign_up_with_email_and_password/sign_up_with_email_and_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_with_email_and_password_state.dart';

class SignUpWithEmailAndPasswordCubit
    extends Cubit<SignUpWithEmailAndPasswordState> {
  final SignUpWithEmailAndPasswordUsecase _signUpWithEmailAndPasswordUsecase;
  SignUpWithEmailAndPasswordCubit({
    required SignUpWithEmailAndPasswordUsecase
        signUpWithEmailAndPasswordUsecase,
  })  : _signUpWithEmailAndPasswordUsecase = signUpWithEmailAndPasswordUsecase,
        super(SignUpWithEmailAndPasswordInitialState());

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignUpWithEmailAndPasswordLoadingState());
    final result = await _signUpWithEmailAndPasswordUsecase(
      signUpAndInParamsEntity: SignUpAndInParamsEntity(
        email: Email.create(email),
        password: Password.create(password),
      ),
    );
    result.fold(
      (failure) => emit(
        SignUpWithEmailAndPasswordErrorState(
          message: failure.message,
        ),
      ),
      (_) => emit(SignUpWithEmailAndPasswordSuccessState()),
    );
  }
}
