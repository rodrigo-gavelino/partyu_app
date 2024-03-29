import 'package:flutter/material.dart';
import 'package:partyu/core/shared/presenter/cubits/generics/generic_field_state.dart';

class ValidatorDecoration {
  ValidatorDecoration._();
  static InputDecoration textFieldDecoration({
    GenericFieldState? state,
    TextEditingController? controller,
    String? label,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    bool isPassword = false,
  }) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: Icon(
        prefixIcon,
        color: controller!.text.isNotEmpty
            ? state!.isValid!
                ? Colors.green
                : Colors.red
            : Colors.black,
      ),
      suffixIcon: isPassword
          ? suffixIcon
          : controller.text.isNotEmpty
              ? Icon(
                  state!.isValid!
                      ? state.isValid!
                          ? Icons.check_circle
                          : Icons.error
                      : Icons.error,
                  color: state.isValid! ? Colors.green : Colors.red,
                )
              : null,
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: state!.isValid! ? Colors.black : Colors.red,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: state.isValid!
            ? BorderSide.none
            : BorderSide(
                color: state.isValid! ? Colors.black : Colors.red,
              ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: controller.text.isNotEmpty
              ? state.isValid!
                  ? Colors.green
                  : Colors.red
              : Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: state.isValid! ? Colors.black : Colors.red,
        ),
      ),
      errorText: state.isValid! ? '' : state.errorMessage ?? '',
    );
  }
}
