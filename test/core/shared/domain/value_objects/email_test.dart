import 'package:Partyu/core/errors/failures/value_failures/email_failure.dart';
import 'package:Partyu/core/shared/domain/value_objects/email.dart';
import 'package:Partyu/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Email', () {
    test('should return Right with valid email', () {
      const validEmail = 'test@example.com';
      final email = Email.create(validEmail);

      expect(email.value, isA<Right>());
      email.value.fold(
            (failure) => fail('Expected a Right, but got a Left'),
            (validEmailValue) => expect(validEmailValue, equals(validEmail)),
      );
    });

    test('should return Left with invalid email', () {
      const invalidEmail = 'invalidemail';
      final email = Email.create(invalidEmail);

      expect(email.value, isA<Left>());
      email.value.fold(
            (failure) {
          expect(failure, isA<EmailFailure>());
          expect(failure.failedValue, equals(invalidEmail));
        },
            (r) => fail('Expected a Left, but got a Right'),
      );
    });
  });
}
