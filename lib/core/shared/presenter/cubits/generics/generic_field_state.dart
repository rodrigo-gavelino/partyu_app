import 'package:equatable/equatable.dart';

abstract class GenericFieldState extends Equatable {
  final bool? isValid;
  final String? errorMessage;

  const GenericFieldState({this.isValid, this.errorMessage});
}
