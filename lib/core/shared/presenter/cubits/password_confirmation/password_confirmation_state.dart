part of 'password_confirmation_cubit.dart';

abstract class PasswordConfirmationState extends PasswordState {
  final Password confirmPassword;
  const PasswordConfirmationState({
    required this.confirmPassword,
    super.isValid = true,
    super.errorMessage,
  }) : super(password: confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class PasswordConfirmationInitialState extends PasswordConfirmationState {
  PasswordConfirmationInitialState()
      : super(confirmPassword: Password.create(''));
}

class PasswordConfirmationEmptyState extends PasswordConfirmationState {
  PasswordConfirmationEmptyState()
      : super(confirmPassword: Password.create(''), isValid: true);

  @override
  List<Object> get props => [isValid!];
}

class PasswordConfirmationValidState extends PasswordConfirmationState {
  const PasswordConfirmationValidState({required Password confirmPassword})
      : super(confirmPassword: confirmPassword, isValid: true);

  @override
  List<Object> get props => [isValid!];
}

class PasswordConfirmationInvalidState extends PasswordConfirmationState {
  PasswordConfirmationInvalidState({required String errorMessage})
      : super(
          confirmPassword: Password.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}
