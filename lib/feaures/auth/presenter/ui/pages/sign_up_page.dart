import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partyu/core/shared/presenter/cubits/email/email_cubit.dart';
import 'package:partyu/core/shared/presenter/cubits/password/password_cubit.dart';
import 'package:partyu/core/shared/presenter/cubits/password_confirmation/password_confirmation_cubit.dart';
import 'package:partyu/core/shared/presenter/ui/widgets/partyu_text_form_field.dart';
import 'package:partyu/feaures/auth/core_auth/routes/auth_named_routes.dart';
import 'package:partyu/feaures/auth/presenter/cubits/sign_up_with_email_and_password/sign_up_with_email_and_password_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpWithEmailAndPasswordCubit _signUpWithEmailAndPasswordCubit;
  late final EmailCubit _emailCubit;
  late final PasswordCubit _passwordCubit;
  late final PasswordConfirmationCubit _passwordConfirmationCubit;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _signUpWithEmailAndPasswordCubit =
        context.read<SignUpWithEmailAndPasswordCubit>();
    _emailCubit = context.read<EmailCubit>();
    _passwordCubit = context.read<PasswordCubit>();
    _passwordConfirmationCubit = context.read<PasswordConfirmationCubit>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    bool isEmailValid =
        _emailCubit.state.isValid! && emailController.text.isNotEmpty;

    bool isPasswordValid =
        _passwordCubit.state.isValid! && passwordController.text.isNotEmpty;

    bool isPasswordConfirmationValid =
        _passwordConfirmationCubit.state.isValid! &&
            confirmPasswordController.text.isNotEmpty;

    setState(() {
      isButtonEnabled =
          isEmailValid && isPasswordValid && isPasswordConfirmationValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: BlocConsumer<SignUpWithEmailAndPasswordCubit,
          SignUpWithEmailAndPasswordState>(
        bloc: _signUpWithEmailAndPasswordCubit,
        listener: (context, state) {
          if (state is SignUpWithEmailAndPasswordSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is SignUpWithEmailAndPasswordLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SignUpWithEmailAndPasswordErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Scaffold(
              bottomNavigationBar: !isKeyboardVisible
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Colors.grey[400],
                          backgroundColor: Colors.white,
                          textStyle: isButtonEnabled
                              ? const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)
                              : const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: isButtonEnabled
                            ? () => _signUpWithEmailAndPasswordCubit
                                    .signUpWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                )
                            : null,
                        child: Text(
                          'CADASTRAR',
                          style: TextStyle(
                            color: isButtonEnabled ? Colors.black : Colors.grey,
                          ),
                        ),
                      ))
                  : GestureDetector(
                      onTap: isButtonEnabled
                          ? () => _signUpWithEmailAndPasswordCubit
                                  .signUpWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              )
                          : null,
                      child: Container(
                        color:
                            isButtonEnabled ? Colors.white : Colors.grey[400],
                        height: 64,
                        child: Center(
                          child: Text(
                            'CADASTRAR',
                            style: TextStyle(
                              color:
                                  isButtonEnabled ? Colors.black : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PartyuTextFormField<EmailCubit, EmailState>(
                        labelText: 'Email',
                        onChanged: (email) {
                          _emailCubit.emailChanged(email);
                          _updateButtonState();
                        },
                        prefixIcon: Icons.email,
                        cubit: _emailCubit,
                        controller: emailController),
                    const SizedBox(height: 8),
                    PartyuTextFormField<PasswordCubit, PasswordState>(
                      labelText: 'Senha',
                      onChanged: (password) {
                        _passwordCubit.passwordChanged(password);
                        _updateButtonState();
                      },
                      cubit: _passwordCubit,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 8),
                    PartyuTextFormField<PasswordConfirmationCubit,
                        PasswordConfirmationState>(
                      labelText: 'Confirme sua senha',
                      onChanged: (passwordConfirmation) {
                        _passwordConfirmationCubit.confirmPasswordChanged(
                          password: passwordController.text,
                          confirmPassword: passwordConfirmation,
                        );
                        _updateButtonState();
                      },
                      cubit: _passwordConfirmationCubit,
                      controller: confirmPasswordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já tem uma conta? '),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, AuthNamedRoutes.signIn),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
