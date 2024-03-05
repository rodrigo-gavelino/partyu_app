import 'package:Partyu/core/errors/failures/value_failures/value_failure.dart';

class PasswordFailures extends ValueFailure<String> {
  PasswordFailures(String value) : super(value);

  @override
  String toString() {
    return 'PasswordFailure(failedValue: $failedValue)';
  }

  static PasswordFailures invalidPassword({required String failedValue}) {
    return PasswordFailures(failedValue);
  }

  static PasswordLessThanEightCharacters shortPassword(
      {required String failedValue}) {
    return PasswordLessThanEightCharacters(failedValue);
  }

  static PasswordNoUpperCase noUpperCase({required String failedValue}) {
    return PasswordNoUpperCase(failedValue);
  }

  static PasswordNoLowerCase noLowerCase({required String failedValue}) {
    return PasswordNoLowerCase(failedValue);
  }

  static PasswordNoNumber noNumber({required String failedValue}) {
    return PasswordNoNumber(failedValue);
  }

  static PasswordNoSpecialCharacter noSpecialCharacter(
      {required String failedValue}) {
    return PasswordNoSpecialCharacter(failedValue);
  }
}

class PasswordLessThanEightCharacters extends PasswordFailures {
  PasswordLessThanEightCharacters(String value) : super(value);
}

class PasswordNoUpperCase extends PasswordFailures {
  PasswordNoUpperCase(String value) : super(value);
}

class PasswordNoLowerCase extends PasswordFailures {
  PasswordNoLowerCase(String value) : super(value);
}

class PasswordNoNumber extends PasswordFailures {
  PasswordNoNumber(String value) : super(value);
}

class PasswordNoSpecialCharacter extends PasswordFailures {
  PasswordNoSpecialCharacter(String value) : super(value);
}
