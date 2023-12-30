abstract class ValueFailure<T> extends Error {
  final T failedValue;

  ValueFailure(this.failedValue);

  @override
  String toString() {
    const String explanation =
        'Encountered a value failure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $failedValue');
  }

}