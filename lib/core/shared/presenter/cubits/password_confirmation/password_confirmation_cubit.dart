import 'package:bloc/bloc.dart';
import 'package:partyu/core/shared/domain/value_objects/password.dart';
import 'package:partyu/core/shared/presenter/cubits/password/password_cubit.dart';

part 'password_confirmation_state.dart';

class PasswordConfirmationCubit extends Cubit<PasswordConfirmationState> {
  PasswordConfirmationCubit() : super(PasswordConfirmationInitialState());

  void confirmPasswordChanged({
    required String password,
    required String confirmPassword,
  }) {
    if (password == confirmPassword) {
      emit(
        PasswordConfirmationValidState(
          confirmPassword: Password.create(
            confirmPassword,
          ),
        ),
      );
    } else if (confirmPassword.isEmpty) {
      emit(
        PasswordConfirmationInitialState(),
      );
    } else {
      emit(
        PasswordConfirmationInvalidState(
          errorMessage: 'Senhas não são iguais',
        ),
      );
    }
  }
}
