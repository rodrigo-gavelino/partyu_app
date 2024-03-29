import 'package:flutter_test/flutter_test.dart';
import 'package:partyu/core/shared/domain/entities/sign_up_and_in_params_entity.dart';
import 'package:partyu/core/shared/domain/value_objects/email.dart';
import 'package:partyu/core/shared/domain/value_objects/password.dart';

void main() {
  group('SignUpAndInParamsEntity Tests', () {
    test('Should create entity correctly', () {
      final email = Email.create('test@example.com');
      final password = Password.create('StrongPass123!');

      final entity = SignUpAndInParamsEntity(email: email, password: password);

      expect(entity.email, email);
      expect(entity.password, password);
    });

    test('Should be equal if email and password are the same', () {
      final email = Email.create('test@example.com');
      final password = Password.create('StrongPass123!');

      final entity1 = SignUpAndInParamsEntity(email: email, password: password);
      final entity2 = SignUpAndInParamsEntity(email: email, password: password);

      expect(entity1, equals(entity2));
    });

    test('Should have the same hashCode for equal objects', () {
      final email = Email.create('test@example.com');
      final password = Password.create('StrongPass123!');

      final entity1 = SignUpAndInParamsEntity(email: email, password: password);
      final entity2 = SignUpAndInParamsEntity(email: email, password: password);

      expect(entity1.hashCode, entity2.hashCode);
    });
  });
}
