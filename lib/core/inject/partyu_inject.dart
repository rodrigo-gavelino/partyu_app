import 'package:get_it/get_it.dart';
import 'package:partyu/core/externals/inject/external_inject.dart';
import 'package:partyu/feaures/auth/core_auth/inject/auth_inject.dart';
import 'package:partyu/feaures/splash/core_splash/inject/splash_inject.dart';

GetIt getIt = GetIt.instance;

class PartyuInject {
  static Future<void> call(GetIt getIt) async {
    await ExternalInject.call(getIt);
    await AuthInject.call(getIt);
    await SplashInject.call(getIt);
  }
}
