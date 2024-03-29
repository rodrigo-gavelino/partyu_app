import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partyu/core/shared/presenter/cubits/generics/generic_field_state.dart';
import 'package:partyu/core/shared/presenter/ui/widgets/validator_decoration.dart';

class PartyuTextFormField<CubitT extends Cubit<StateT>,
    StateT extends GenericFieldState> extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final CubitT? cubit;
  final bool enabled;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isPassword;
  const PartyuTextFormField({
    super.key,
    this.labelText,
    this.onChanged,
    this.cubit,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitT, StateT>(
        bloc: cubit,
        builder: (context, state) {
          return TextFormField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            enabled: enabled,
            controller: controller,
            onChanged: onChanged,
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            decoration: ValidatorDecoration.textFieldDecoration(
              state: state,
              label: labelText!,
              prefixIcon: prefixIcon!,
              suffixIcon: suffixIcon,
              controller: controller!,
              obscureText: obscureText,
              isPassword: isPassword,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          );
        });
  }
}
