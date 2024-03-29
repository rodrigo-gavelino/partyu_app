import 'package:partyu/core/errors/failures/value_failures/email_failure.dart';
import 'package:partyu/core/errors/failures/value_failures/value_failure.dart';
import 'package:partyu/core/shared/domain/value_objects/value_object.dart';
import 'package:partyu/core/utils/either.dart';

class Email extends ValueObject<Either<ValueFailure<String>, String>> {
  Email(super.value);

  factory Email.create(String email) {
    final validationResult = validateEmailAddress(email);
    return Email(validationResult);
  }

  static Either<ValueFailure<String>, String> validateEmailAddress(
      String email) {
    const String emailRegex =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (RegExp(emailRegex).hasMatch(email)) {
      return Right(email);
    } else {
      return Left(EmailFailure.invalidEmail(failedValue: 'Email inválido'));
    }
  }
}
