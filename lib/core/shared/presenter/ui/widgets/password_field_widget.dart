import 'package:Partyu/core/shared/presenter/cubits/password/password_cubit.dart';
import 'package:Partyu/core/shared/presenter/ui/widgets/validator_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool? enabled;
  const PasswordFieldWidget({
    Key? key,
    required this.controller,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, PasswordState>(
      bloc: context.read<PasswordCubit>(),
      builder: (context, state) {
        return TextFormField(
          enabled: enabled,
          cursorColor:
              state is PasswordInvalidState ? Colors.red : Colors.black,
          controller: controller,
          onChanged: (password) =>
              context.read<PasswordCubit>().passwordChanged(password),
          decoration:
              ValidatorDecoration.textFieldDecoration(state, 'Password'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      },
    );
  }
}
