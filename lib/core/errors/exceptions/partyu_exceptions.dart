abstract class PartyuExceptions implements Exception {
  final String message;
  final String code;
  final StackTrace? stackTrace;

  PartyuExceptions({
    required this.message,
    required this.code,
    this.stackTrace,
  });

  String toString() {
    return "$code $message";
  }
}

abstract class ServerExceptions extends PartyuExceptions {
  ServerExceptions({
    required super.message,
    required super.code,
    super.stackTrace,
  });
}

abstract class CacheExceptions extends PartyuExceptions {
  CacheExceptions({
    required super.message,
    required super.code,
    super.stackTrace,
  });
}
