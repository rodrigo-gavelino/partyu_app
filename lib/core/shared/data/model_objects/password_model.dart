import 'package:Partyu/core/errors/failures/value_failures/password_failure.dart';
import 'package:Partyu/core/shared/domain/value_objects/password.dart';

class PasswordModel extends Password {
  PasswordModel(super.value);

  factory PasswordModel.create(String password) {
    return PasswordModel(Password.create(password).value);
  }

  Map<String, dynamic> toMap() {
    return value.fold(
      (failure) => throw PasswordFailures(failure.failedValue),
      (password) => {'password': password},
    );
  }

  String get passwordDTO =>
      toMap().entries.firstWhere((element) => element.key == 'password').value;
}
