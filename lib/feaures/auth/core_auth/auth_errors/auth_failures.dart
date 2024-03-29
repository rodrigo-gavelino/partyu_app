import 'package:partyu/core/errors/failures/partyu_failures.dart';

abstract class AuthFailures extends PartyuFailures {
  AuthFailures({
    required super.message,
    required super.code,
  });
}

class SignUpWithEmailAndPasswordFailure extends AuthFailures {
  SignUpWithEmailAndPasswordFailure({
    required super.message,
    required super.code,
  });
}

class SignInWithEmailAndPasswordFailure extends AuthFailures {
  SignInWithEmailAndPasswordFailure({
    required super.message,
    required super.code,
  });
}
