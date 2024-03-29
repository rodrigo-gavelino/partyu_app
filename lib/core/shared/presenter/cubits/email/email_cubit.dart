import 'package:bloc/bloc.dart';
import 'package:partyu/core/shared/domain/value_objects/email.dart';
import 'package:partyu/core/shared/presenter/cubits/generics/generic_field_state.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitialState());

  void emailChanged(String email) {
    if (email.isEmpty) {
      emit(EmailEmptyState());
    } else {
      final emailObject = Email.create(email);
      emailObject.value.fold(
        (failure) => emit(
          EmailInvalidState(
            errorMessage: emailObject.value.fold(
              (l) => l.failedValue,
              (r) => '',
            ),
          ),
        ),
        (_) => emit(
          EmailValidState(email: emailObject),
        ),
      );
    }
  }
}
