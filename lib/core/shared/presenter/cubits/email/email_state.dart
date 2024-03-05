part of 'email_cubit.dart';

abstract class EmailState extends GenericFieldState {
  final Email email;

  const EmailState({
    required this.email,
    super.isValid = true,
    super.errorMessage,
  });

  @override
  List<Object> get props => [email];
}

class EmailInitialState extends EmailState {
  EmailInitialState() : super(email: Email.create(''));
}

class EmailEmptyState extends EmailState {
  EmailEmptyState() : super(email: Email.create(''), isValid: true);

  @override
  List<Object> get props => [isValid!];
}

class EmailValidState extends EmailState {
  const EmailValidState({required Email email})
      : super(email: email, isValid: true);

  @override
  List<Object> get props => [isValid!];
}

class EmailInvalidState extends EmailState {
  EmailInvalidState({required String errorMessage})
      : super(
          email: Email.create(''),
          isValid: false,
          errorMessage: errorMessage,
        );

  @override
  List<Object> get props => [isValid!, errorMessage!];
}
