import 'value_failure.dart';

class EmailFailure extends ValueFailure<String> {
  EmailFailure(super.failedValue);

  @override
  String toString() {
    return Error.safeToString('Email inválido: $failedValue');
  }

  static EmailFailure invalidEmail({required String failedValue}) {
    return EmailFailure(failedValue);
  }
}
