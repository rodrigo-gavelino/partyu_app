// Define a classe base Either com dois tipos genéricos, L para Left e R para Right
abstract class Either<L, R> {
  // Método para verificar se é um Left
  bool isLeft();

  // Método para verificar se é um Right
  bool isRight();

  // Método fold para manipular os valores
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn);

  // Método getOrElse para obter o valor Right ou um valor padrão
  R getOrElse(R Function() defaultValue);
}

// Implementação da classe Left
class Left<L, R> extends Either<L, R> {
  final L value;

  Left(this.value);

  @override
  bool isLeft() => true;

  @override
  bool isRight() => false;

  @override
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) => leftFn(value);

  @override
  R getOrElse(R Function() defaultValue) => defaultValue();
}

// Implementação da classe Right
class Right<L, R> extends Either<L, R> {
  final R value;

  Right(this.value);

  @override
  bool isLeft() => false;

  @override
  bool isRight() => true;

  @override
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) => rightFn(value);

  @override
  R getOrElse(R Function() defaultValue) => value;
}
