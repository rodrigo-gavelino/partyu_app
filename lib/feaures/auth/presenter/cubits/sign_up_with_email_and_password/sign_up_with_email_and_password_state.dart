part of 'sign_up_with_email_and_password_cubit.dart';

abstract class SignUpWithEmailAndPasswordState extends Equatable {
  const SignUpWithEmailAndPasswordState();
}

class SignUpWithEmailAndPasswordInitialState
    extends SignUpWithEmailAndPasswordState {
  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPasswordLoadingState
    extends SignUpWithEmailAndPasswordState {
  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPasswordSuccessState
    extends SignUpWithEmailAndPasswordState {
  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPasswordErrorState
    extends SignUpWithEmailAndPasswordState {
  final String message;

  const SignUpWithEmailAndPasswordErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class HasEmailAndPasswordState extends SignUpWithEmailAndPasswordState {
  final bool isValid;
  final String errorMessage;

  const HasEmailAndPasswordState(
      {this.isValid = false, this.errorMessage = 'Invalid input'});

  @override
  List<Object> get props => [isValid, errorMessage];
}
