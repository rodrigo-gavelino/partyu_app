import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partyu/core/inject/partyu_inject.dart';
import 'package:partyu/core/shared/presenter/cubits/email/email_cubit.dart';
import 'package:partyu/core/shared/presenter/cubits/password/password_cubit.dart';
import 'package:partyu/core/shared/presenter/cubits/password_confirmation/password_confirmation_cubit.dart';
import 'package:partyu/feaures/auth/core_auth/routes/auth_named_routes.dart';
import 'package:partyu/feaures/auth/domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';
import 'package:partyu/feaures/auth/domain/usecases/sign_up_with_email_and_password/sign_up_with_email_and_password_usecase.dart';
import 'package:partyu/feaures/auth/presenter/cubits/sign_in_with_email_and_password/sign_in_with_email_and_password_cubit.dart';
import 'package:partyu/feaures/auth/presenter/cubits/sign_up_with_email_and_password/sign_up_with_email_and_password_cubit.dart';
import 'package:partyu/feaures/auth/presenter/ui/pages/sign_in_page.dart';
import 'package:partyu/feaures/auth/presenter/ui/pages/sign_up_page.dart';

class AuthRoutes {
  static Map<String, Widget Function(BuildContext context)> getAuthRoutes() {
    return {
      AuthNamedRoutes.signUp: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignUpWithEmailAndPasswordCubit(
                  signUpWithEmailAndPasswordUsecase:
                      getIt.get<SignUpWithEmailAndPasswordUsecase>(),
                ),
              ),
              BlocProvider(
                create: (context) => EmailCubit(),
              ),
              BlocProvider(
                create: (context) => PasswordCubit(),
              ),
              BlocProvider(
                create: (context) => PasswordConfirmationCubit(),
              ),
            ],
            child: const SignUpPage(),
          ),
      AuthNamedRoutes.signIn: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInWithEmailAndPasswordCubit(
                  signInWithEmailAndPasswordUsecase:
                      getIt.get<SignInWithEmailAndPasswordUsecase>(),
                ),
              ),
              BlocProvider(
                create: (context) => EmailCubit(),
              ),
              BlocProvider(
                create: (context) => PasswordCubit(),
              ),
            ],
            child: const SignInPage(),
          )
    };
  }
}
