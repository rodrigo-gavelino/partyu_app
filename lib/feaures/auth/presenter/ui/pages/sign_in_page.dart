import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partyu/core/shared/presenter/cubits/email/email_cubit.dart';
import 'package:partyu/core/shared/presenter/cubits/password/password_cubit.dart';
import 'package:partyu/core/shared/presenter/ui/widgets/partyu_text_form_field.dart';
import 'package:partyu/feaures/auth/core_auth/routes/auth_named_routes.dart';
import 'package:partyu/feaures/auth/presenter/cubits/sign_in_with_email_and_password/sign_in_with_email_and_password_cubit.dart';
import 'package:partyu/feaures/auth/presenter/cubits/sign_up_with_email_and_password/sign_up_with_email_and_password_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SignInWithEmailAndPasswordCubit _signInWithEmailAndPasswordCubit;
  late final EmailCubit _emailCubit;
  late final PasswordCubit _passwordCubit;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _signInWithEmailAndPasswordCubit =
        context.read<SignInWithEmailAndPasswordCubit>();
    _emailCubit = context.read<EmailCubit>();
    _passwordCubit = context.read<PasswordCubit>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return BlocConsumer<SignInWithEmailAndPasswordCubit,
        SignInWithEmailAndPasswordState>(
      bloc: _signInWithEmailAndPasswordCubit,
      listener: (context, state) {
        if (state is SignUpWithEmailAndPasswordSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is SignInWithEmailAndPasswordLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SignInWithEmailAndPasswordErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              bottomNavigationBar: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: isKeyboardVisible ? Curves.easeIn : Curves.easeOut,
                child: !isKeyboardVisible
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('ENTRAR',
                              style: TextStyle(color: Colors.black)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: Colors.white,
                          height: 64,
                          child: const Center(
                            child: Text(
                              'ENTRAR',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) => _emailCubit.emailChanged(email),
                        cubit: _emailCubit,
                        controller: emailController,
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(height: 8),
                      PartyuTextFormField<PasswordCubit, PasswordState>(
                        isPassword: true,
                        cubit: _passwordCubit,
                        obscureText:
                            _passwordCubit.state is PasswordVisibilityState
                                ? !_passwordCubit.state.isVisible!
                                : true,
                        labelText: 'Senha',
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            !_passwordCubit.state.isVisible!
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _passwordCubit.togglePasswordVisibility();
                          },
                        ),
                      ),
                      const Text('Esqueceu a senha? '),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não tem uma conta? '),
                          TextButton(
                            child: const Text(
                              'Cadastre-se',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, AuthNamedRoutes.signUp);
                            },
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          );
        }
      },
    );
  }
}
