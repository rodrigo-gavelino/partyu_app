import 'package:Partyu/core/inject/partyu_inject.dart';
import 'package:Partyu/core/shared/presenter/cubits/email/email_cubit.dart';
import 'package:Partyu/core/shared/presenter/cubits/password/password_cubit.dart';
import 'package:Partyu/feaures/auth/core_auth/routes/auth_named_routes.dart';
import 'package:Partyu/feaures/auth/domain/usecases/sign_up_with_email_and_password/sign_up_with_email_and_password_usecase.dart';
import 'package:Partyu/feaures/auth/presenter/cubits/sign_up_with_email_and_password/sign_up_with_email_and_password_cubit.dart';
import 'package:Partyu/feaures/auth/presenter/ui/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              )
            ],
            child: const SignUpPage(),
          ),
      // AuthNamedRoutes.signIn: (context) => SignInPage(),
    };
  }
}
