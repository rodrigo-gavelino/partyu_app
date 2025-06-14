import 'package:partyu/core/errors/exceptions/partyu_exceptions.dart';

abstract class AuthExceptions extends PartyuExceptions {
  AuthExceptions({
    required super.message,
    required super.code,
    super.stackTrace,
  });
}

class SignUpWithEmailAndPasswordException extends AuthExceptions {
  SignUpWithEmailAndPasswordException({
    required super.message,
    required super.code,
    super.stackTrace,
  });
}

class SignInWithEmailAndPasswordException extends AuthExceptions {
  SignInWithEmailAndPasswordException({
    required super.message,
    required super.code,
    super.stackTrace,
  });
}
