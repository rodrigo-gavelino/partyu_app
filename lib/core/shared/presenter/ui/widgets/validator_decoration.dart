import 'package:Partyu/core/shared/presenter/cubits/generics/generic_field_state.dart';
import 'package:flutter/material.dart';

class ValidatorDecoration {
  static InputDecoration textFieldDecoration(
      GenericFieldState state, String label) {
    return InputDecoration(
      labelStyle: TextStyle(
        color: state.isValid! ? Colors.black : Colors.red,
      ),
      labelText: label,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        borderSide: BorderSide(
          color: state.isValid! ? Colors.black : Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        borderSide: BorderSide(
          color: state.isValid! ? Colors.black : Colors.red,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        borderSide: BorderSide(
          color: state.isValid! ? Colors.black : Colors.red,
        ),
      ),
      errorText: state.isValid! ? '' : state.errorMessage ?? '',
    );
  }
}
