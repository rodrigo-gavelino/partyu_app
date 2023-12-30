

import 'package:Partyu/core/errors/failures/value_failures/email_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailFailure', () {
    test('should contain the failed value', () {
      const failedValue = 'invalidemail@example';
      final emailFailure = EmailFailure.invalidEmail(failedValue: failedValue);

      expect(emailFailure.failedValue, equals(failedValue));
    });

    test('toString should return a descriptive message', () {
      const failedValue = 'invalidemail@example';
      final emailFailure = EmailFailure.invalidEmail(failedValue: failedValue);

      expect(emailFailure.toString(), contains('Invalid Email'));
      expect(emailFailure.toString(), contains(failedValue));
    });
  });
}
