
import 'package:Partyu/core/errors/failures/value_failures/value_failure.dart';

class PasswordFailure extends ValueFailure<String> {
  PasswordFailure(super.failedValue);

  @override
  String toString() {
    return 'PasswordFailure(failedValue: $failedValue)';
  }

  static PasswordFailure invalidPassword({required String failedValue}) {
    return PasswordFailure(failedValue);
  }
}