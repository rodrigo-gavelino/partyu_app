abstract class PartyuFailures {
  final String message;
  final String code;

  PartyuFailures({
    required this.message,
    required this.code,
  });

  String toString() {
    return "$code $message";
  }
}

abstract class ServerFailures extends PartyuFailures {
  ServerFailures({
    required super.message,
    required super.code,
  });
}

abstract class CacheFailures extends PartyuFailures {
  CacheFailures({
    required super.message,
    required super.code,
  });
}
