import 'package:Partyu/core/externals/firebase/auth/abstration/partyu_auth_methods.dart';
import 'package:Partyu/core/externals/firebase/auth/abstration/partyu_auth_platform_interface.dart';
import 'package:Partyu/core/externals/firebase/auth/sign_in_with_email_and_password.dart';
import 'package:Partyu/core/externals/firebase/auth/sign_up_with_email_and_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class ExternalInject {
  static Future<void> call(GetIt getIt) async {
    getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);

    getIt.registerFactory<PartyuAuthMethods>(
      () => PartyuAuthMethods(
        firebaseAuth: getIt.get<FirebaseAuth>(),
      ),
    );
    getIt.registerFactory<PartyuAuthPlatform>(
      () => PartyuAuthPlatform.instance,
    );

    getIt.registerFactory<SignUpWithEmailAndPassword>(
      () => SignUpWithEmailAndPasswordImpl(
          partyuAuthPlatform: getIt.get<PartyuAuthPlatform>()),
    );

    getIt.registerFactory<SignInWithEmailAndPassword>(
      () => SignInWithEmailAndPasswordImpl(
          partyuAuthPlatform: getIt.get<PartyuAuthPlatform>()),
    );
  }
}
