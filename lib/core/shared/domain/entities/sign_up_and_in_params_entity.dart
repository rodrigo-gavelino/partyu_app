import 'package:Partyu/core/shared/domain/value_objects/email.dart';
import 'package:Partyu/core/shared/domain/value_objects/password.dart';

class SignUpAndInParamsEntity {
  final Email email;
  final Password password;

  SignUpAndInParamsEntity({
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpAndInParamsEntity &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}