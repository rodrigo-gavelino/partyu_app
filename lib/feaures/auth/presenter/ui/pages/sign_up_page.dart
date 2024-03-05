import 'package:Partyu/core/shared/presenter/cubits/email/email_cubit.dart';
import 'package:Partyu/core/shared/presenter/cubits/password/password_cubit.dart';
import 'package:Partyu/core/shared/presenter/ui/widgets/email_field_widget.dart';
import 'package:Partyu/core/shared/presenter/ui/widgets/password_field_widget.dart';
import 'package:Partyu/feaures/auth/presenter/cubits/sign_up_with_email_and_password/sign_up_with_email_and_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpWithEmailAndPasswordCubit _signUpWithEmailAndPasswordCubit;
  late final EmailCubit _emailCubit;
  late final PasswordCubit _passwordCubit;

  @override
  void initState() {
    super.initState();
    _signUpWithEmailAndPasswordCubit =
        context.read<SignUpWithEmailAndPasswordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Sign Up'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmailFieldWidget(
                          controller: emailController,
                        ),
                        const SizedBox(height: 8),
                        PasswordFieldWidget(
                          controller: passwordController,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: null,
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  )),
            );
          }
        },
      ),
    );
  }
}
