import 'package:Partyu/core/shared/domain/value_objects/email.dart';
import 'package:Partyu/core/shared/presenter/cubits/generics/generic_field_state.dart';
import 'package:bloc/bloc.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitialState());

  void emailChanged(String email) {
    if (email.isEmpty) {
      emit(EmailEmptyState());
    } else {
      final emailObject = Email.create(email);
      emailObject.value.fold(
        (failure) => emit(EmailInvalidState(errorMessage: 'Invalid Email')),
        (_) => emit(
          EmailValidState(email: emailObject),
        ),
      );
    }
  }
}
