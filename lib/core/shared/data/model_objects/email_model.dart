import 'package:Partyu/core/errors/failures/value_failures/email_failure.dart';
import 'package:Partyu/core/shared/domain/value_objects/email.dart';

class EmailModel extends Email {
  EmailModel(super.value);

  factory EmailModel.create(String email) {
    return EmailModel(Email.create(email).value);
  }

  Map<String, dynamic> toMap() {
    return value.fold(
      (failure) => throw EmailFailure(failure.failedValue),
      (email) => {'email': email},
    );
  }

  String get emailDTO =>
      toMap().entries.firstWhere((element) => element.key == 'email').value;
}
