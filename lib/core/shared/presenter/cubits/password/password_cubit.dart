import 'package:bloc/bloc.dart';
import 'package:partyu/core/errors/failures/value_failures/password_failure.dart';
import 'package:partyu/core/shared/domain/value_objects/password.dart';
import 'package:partyu/core/shared/presenter/cubits/generics/generic_field_state.dart';

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
            emit(
              PasswordInvalidLengthState(errorMessage: failure.failedValue),
            );
          } else if (failure is PasswordNoUpperCase) {
            emit(
              PasswordInvalidUpperCaseState(errorMessage: failure.failedValue),
            );
          } else if (failure is PasswordNoLowerCase) {
            emit(
              PasswordInvalidLowerCaseState(errorMessage: failure.failedValue),
            );
          } else if (failure is PasswordNoNumber) {
            emit(
              PasswordInvalidNumberState(errorMessage: failure.failedValue),
            );
          } else if (failure is PasswordNoSpecialCharacter) {
            emit(
              PasswordInvalidSpecialCharacterState(
                  errorMessage: failure.failedValue),
            );
          } else {
            emit(
              PasswordInvalidState(errorMessage: failure.failedValue),
            );
          }
        },
        (_) => emit(
          PasswordValidState(password: passwordObject),
        ),
      );
    }
  }

  void togglePasswordVisibility() {
    if (state.isVisible!) {
      emit(state.copyWith(isVisible: false));
    } else {
      emit(state.copyWith(isVisible: true));
    }
  }
}
