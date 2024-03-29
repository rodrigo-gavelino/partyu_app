part of 'sign_in_with_email_and_password_cubit.dart';

abstract class SignInWithEmailAndPasswordState extends Equatable {
  const SignInWithEmailAndPasswordState();
}

class SignInWithEmailAndPasswordInitialState
    extends SignInWithEmailAndPasswordState {
  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPasswordLoadingState
    extends SignInWithEmailAndPasswordState {
  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPasswordSuccessState
    extends SignInWithEmailAndPasswordState {
  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPasswordErrorState
    extends SignInWithEmailAndPasswordState {
  final String message;

  const SignInWithEmailAndPasswordErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class HasEmailAndPasswordState extends SignInWithEmailAndPasswordState {
  final bool isValid;
  final String errorMessage;

  const HasEmailAndPasswordState(
      {this.isValid = false, this.errorMessage = 'Invalid input'});

  @override
  List<Object> get props => [isValid, errorMessage];
}

class SignInWithEmailAndPasswordShowPasswordState
    extends SignInWithEmailAndPasswordState {
  final bool isPasswordVisible;

  const SignInWithEmailAndPasswordShowPasswordState(
      {required this.isPasswordVisible});

  @override
  List<Object> get props => [isPasswordVisible];
}
