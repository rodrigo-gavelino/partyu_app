import 'package:Partyu/core/externals/inject/external_inject.dart';
import 'package:Partyu/feaures/auth/core_auth/inject/auth_inject.dart';
import 'package:Partyu/feaures/splash/core_splash/inject/splash_inject.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class PartyuInject {
  static Future<void> call(GetIt getIt) async {
    await ExternalInject.call(getIt);
    await AuthInject.call(getIt);
    await SplashInject.call(getIt);
  }
}
