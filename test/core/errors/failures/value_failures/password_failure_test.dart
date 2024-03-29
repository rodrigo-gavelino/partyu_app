import 'package:flutter_test/flutter_test.dart';
import 'package:partyu/core/errors/failures/value_failures/password_failure.dart';

void main() {
  group('PasswordFailure', () {
    test('should contain the failed value', () {
      const failedValue = 'invalidPassword';
      final passwordFailure =
          PasswordFailures.invalidPassword(failedValue: failedValue);

      expect(passwordFailure.failedValue, equals(failedValue));
    });

    test('toString should return a descriptive message', () {
      const failedValue = 'invalidPassword';
      final passwordFailure =
          PasswordFailures.invalidPassword(failedValue: failedValue);

      expect(passwordFailure.toString(), contains('PasswordFailure'));
      expect(passwordFailure.toString(), contains(failedValue));
    });
  });
}
