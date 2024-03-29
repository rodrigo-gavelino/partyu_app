import 'package:flutter_test/flutter_test.dart';
import 'package:partyu/core/errors/failures/value_failures/password_failure.dart';
import 'package:partyu/core/shared/domain/value_objects/password.dart';
import 'package:partyu/core/utils/either.dart';

void main() {
  group('Password', () {
    test('should return Right with valid password', () {
      const validPassword = 'Valid123!';
      final result = Password.create(validPassword);

      expect(result.value, isA<Right>());
      result.value.fold(
        (failure) => fail('Expected a Right, but got a Left'),
        (validPasswordValue) =>
            expect(validPasswordValue, equals(validPassword)),
      );
    });

    test('should return Left with invalid password', () {
      const invalidPassword = 'short';
      final result = Password.create(invalidPassword);

      expect(result.value, isA<Left>());
      result.value.fold(
        (failure) {
          expect(failure, isA<PasswordFailures>());
          expect(failure.failedValue, equals(invalidPassword));
        },
        (r) => fail('Expected a Left, but got a Right'),
      );
    });
  });
}
