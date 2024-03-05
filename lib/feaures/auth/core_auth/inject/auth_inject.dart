import 'package:Partyu/core/externals/firebase/auth/sign_in_with_email_and_password.dart';
import 'package:Partyu/core/externals/firebase/auth/sign_up_with_email_and_password.dart';
import 'package:Partyu/feaures/auth/data/datasources/sign_in_with_email_and_password/sign_in_with_email_and_password_datasource.dart';
import 'package:Partyu/feaures/auth/data/datasources/sign_in_with_email_and_password/sign_in_with_email_and_password_datasource_impl.dart';
import 'package:Partyu/feaures/auth/data/datasources/sign_up_with_email_and_password/sign_up_with_email_and_password_datasource.dart';
import 'package:Partyu/feaures/auth/data/datasources/sign_up_with_email_and_password/sign_up_with_email_and_password_datasource_impl.dart';
import 'package:Partyu/feaures/auth/data/repositories/auth_repository_impl.dart';
import 'package:Partyu/feaures/auth/domain/repositories/auth_repository.dart';
import 'package:Partyu/feaures/auth/domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';
import 'package:Partyu/feaures/auth/domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase_impl.dart';
import 'package:Partyu/feaures/auth/domain/usecases/sign_up_with_email_and_password/sign_up_with_email_and_password_usecase.dart';
import 'package:Partyu/feaures/auth/domain/usecases/sign_up_with_email_and_password/sign_up_with_email_and_password_usecase_impl.dart';
import 'package:get_it/get_it.dart';

class AuthInject {
  static Future<void> call(GetIt getIt) async {
    getIt.registerFactory<SignUpWithEmailAndPasswordDatasource>(
      () => SignUpWithEmailAndPasswordDatasourceImpl(
        signUpWithEmailAndPassword: getIt.get<SignUpWithEmailAndPassword>(),
      ),
    );

    getIt.registerFactory<SignInWithEmailAndPasswordDatasource>(
      () => SignInWithEmailAndPasswordDataSourceImpl(
        signInWithEmailAndPassword: getIt.get<SignInWithEmailAndPassword>(),
      ),
    );

    getIt.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        signUpWithEmailAndPasswordDatasource:
            getIt.get<SignUpWithEmailAndPasswordDatasource>(),
        signInWithEmailAndPasswordDatasource:
            getIt.get<SignInWithEmailAndPasswordDatasource>(),
      ),
    );

    getIt.registerFactory<SignUpWithEmailAndPasswordUsecase>(
      () => SignUpWithEmailAndPasswordUsecaseImpl(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );

    getIt.registerFactory<SignInWithEmailAndPasswordUsecase>(
      () => SignInWithEmailAndPasswordUsecaseImpl(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );

    // getIt.registerFactory<SignUpWithEmailAndPasswordCubit>(
    //   () => SignUpWithEmailAndPasswordCubit(
    //     signUpWithEmailAndPasswordUsecase:
    //         getIt.get<SignUpWithEmailAndPasswordUsecase>(),
    //   ),
    // );
  }
}
