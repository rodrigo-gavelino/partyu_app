import 'package:flutter/cupertino.dart';
import 'package:partyu/app.dart';
import 'package:partyu/core/config/initial_config.dart';

void main() async {
  await InitialConfig.call();

  runApp(const App());
}
