
import 'package:Partyu/core/errors/failures/value_failures/value_failure.dart';

class EmailFailure extends ValueFailure<String> {

  EmailFailure(super.failedValue);

  @override
  String toString() {
    return Error.safeToString('Invalid Email: $failedValue');
  }

  static EmailFailure invalidEmail({required String failedValue}) {
    return EmailFailure(failedValue);
  }
}