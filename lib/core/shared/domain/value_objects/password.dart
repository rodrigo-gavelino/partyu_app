
import 'package:Partyu/core/errors/failures/value_failures/password_failure.dart';
import 'package:Partyu/core/errors/failures/value_failures/value_failure.dart';
import 'package:Partyu/core/shared/domain/value_objects/value_object.dart';
import 'package:Partyu/core/utils/either.dart';

class Password extends ValueObject<Either<ValueFailure<String>, String>> {

  Password._(super.value);

  factory Password.create(String password) {
    final validationResult = validatePassword(password);
    return Password._(validationResult);
  }

  static Either<ValueFailure<String>, String> validatePassword(String password) {
    const String passwordRegex =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$';

    if (RegExp(passwordRegex).hasMatch(password)) {
      return Right(password);
    } else {
      return Left(PasswordFailure.invalidPassword(failedValue: password));
    }
  }

}