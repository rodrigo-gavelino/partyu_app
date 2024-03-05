import 'package:Partyu/core/shared/presenter/cubits/email/email_cubit.dart';
import 'package:Partyu/core/shared/presenter/ui/widgets/validator_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool? enabled;
  const EmailFieldWidget({
    Key? key,
    required this.controller,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailCubit, EmailState>(
      bloc: context.read<EmailCubit>(),
      builder: (context, state) {
        return TextFormField(
          enabled: enabled,
          cursorColor: state is EmailInvalidState ? Colors.red : Colors.black,
          controller: controller,
          onChanged: (email) => context.read<EmailCubit>().emailChanged(email),
          decoration: ValidatorDecoration.textFieldDecoration(state, 'Email'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      },
    );
  }
}
