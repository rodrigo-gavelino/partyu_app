import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:partyu/feaures/auth/domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';

part 'sign_in_with_email_and_password_state.dart';

class SignInWithEmailAndPasswordCubit
    extends Cubit<SignInWithEmailAndPasswordState> {
  final SignInWithEmailAndPasswordUsecase _signInWithEmailAndPasswordUsecase;
  SignInWithEmailAndPasswordCubit({
    required SignInWithEmailAndPasswordUsecase
        signInWithEmailAndPasswordUsecase,
  })  : _signInWithEmailAndPasswordUsecase = signInWithEmailAndPasswordUsecase,
        super(SignInWithEmailAndPasswordInitialState());
}
