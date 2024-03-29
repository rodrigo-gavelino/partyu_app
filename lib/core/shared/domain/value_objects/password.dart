import 'package:partyu/core/errors/failures/value_failures/password_failure.dart';
import 'package:partyu/core/errors/failures/value_failures/value_failure.dart';
import 'package:partyu/core/shared/domain/value_objects/value_object.dart';
import 'package:partyu/core/utils/either.dart';

class Password extends ValueObject<Either<ValueFailure<String>, String>> {
  Password(super.value);

  factory Password.create(String password) {
    final validationResult = validatePassword(password);
    return Password(validationResult);
  }

  static Either<ValueFailure<String>, String> validatePassword(
      String password) {
    const String passwordRegex =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$';

    if (password.length < 8) {
      return Left(
        PasswordFailures.shortPassword(
            failedValue: 'Senha muito curta, mínimo 8 caracteres'),
      );
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return Left(
        PasswordFailures.noUpperCase(
            failedValue: 'Senha deve conter pelo menos uma letra maiúscula'),
      );
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      return Left(
        PasswordFailures.noLowerCase(
            failedValue: 'Senha deve conter pelo menos uma letra minúscula'),
      );
    } else if (!RegExp(r'\d').hasMatch(password)) {
      return Left(
        PasswordFailures.noNumber(
            failedValue: 'Senha deve conter pelo menos um número'),
      );
    } else if (!RegExp(r'[\W_]').hasMatch(password)) {
      return Left(
        PasswordFailures.noSpecialCharacter(
            failedValue: 'Senha deve conter pelo menos um caractere especial'),
      );
    } else if (!RegExp(passwordRegex).hasMatch(password)) {
      return Left(
        PasswordFailures.invalidPassword(failedValue: 'Senha inválida'),
      );
    } else {
      return Right(password);
    }
  }
}
