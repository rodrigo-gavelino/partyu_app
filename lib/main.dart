import 'package:Partyu/app.dart';
import 'package:Partyu/core/config/initial_config.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  await InitialConfig.call();

  runApp(const App());
}
