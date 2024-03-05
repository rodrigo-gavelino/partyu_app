part of 'password_cubit.dart';

abstract class PasswordState extends GenericFieldState {
  final Password password;
  const PasswordState({
    required this.password,
    super.isValid = true,
    super.errorMessage,
  });

  @override
  List<Object> get props => [password];
}

class PasswordInitialState extends PasswordState {
  PasswordInitialState() : super(password: Password.create(''));
}

class PasswordEmptyState extends PasswordState {
  PasswordEmptyState() : super(password: Password.create(''), isValid: true);

  @override
  List<Object> get props => [isValid!];
}

class PasswordValidState extends PasswordState {
  const PasswordValidState({required Password password})
      : super(password: password, isValid: true);

  @override
  List<Object> get props => [isValid!];
}

class PasswordInvalidState extends PasswordState {
  PasswordInvalidState({required String errorMessage})
      : super(
          password: Password.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}

class PasswordInvalidLengthState extends PasswordState {
  PasswordInvalidLengthState({required String errorMessage})
      : super(
          password: Password.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}

class PasswordInvalidUpperCaseState extends PasswordState {
  PasswordInvalidUpperCaseState({required String errorMessage})
      : super(
          password: Password.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}

class PasswordInvalidLowerCaseState extends PasswordState {
  PasswordInvalidLowerCaseState({required String errorMessage})
      : super(
          password: Password.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}

class PasswordInvalidNumberState extends PasswordState {
  PasswordInvalidNumberState({required String errorMessage})
      : super(
          password: Password.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}

class PasswordInvalidSpecialCharacterState extends PasswordState {
  PasswordInvalidSpecialCharacterState({required String errorMessage})
      : super(
          password: Password.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}
