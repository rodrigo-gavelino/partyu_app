import 'package:Partyu/core/errors/failures/value_failures/password_failure.dart';
import 'package:Partyu/core/shared/domain/value_objects/password.dart';
import 'package:Partyu/core/shared/presenter/cubits/generics/generic_field_state.dart';
import 'package:bloc/bloc.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitialState());

  void passwordChanged(String password) {
    if (password.isEmpty) {
      emit(PasswordEmptyState());
    } else {
      final passwordObject = Password.create(password);
      passwordObject.value.fold(
        (failure) {
          if (failure is PasswordLessThanEightCharacters) {
            emit(PasswordInvalidLengthState(
                errorMessage: 'Password is too short'));
          } else if (failure is PasswordNoUpperCase) {
            emit(PasswordInvalidUpperCaseState(
                errorMessage:
                    'Password must contain at least one uppercase letter'));
          } else if (failure is PasswordNoLowerCase) {
            emit(PasswordInvalidLowerCaseState(
                errorMessage:
                    'Password must contain at least one lowercase letter'));
          } else if (failure is PasswordNoNumber) {
            emit(PasswordInvalidNumberState(
                errorMessage: 'Password must contain at least one number'));
          } else if (failure is PasswordNoSpecialCharacter) {
            emit(PasswordInvalidSpecialCharacterState(
                errorMessage:
                    'Password must contain at least one special character'));
          } else {
            emit(PasswordInvalidState(errorMessage: 'test error message'));
          }
        },
        (_) => emit(
          PasswordValidState(password: passwordObject),
        ),
      );
    }
  }
}
