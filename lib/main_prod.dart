import 'package:bibimoney/app/base/app_env.dart';
import 'package:bibimoney/app/view/app.dart';
import 'package:bibimoney/firebase.dart';
import 'package:flutter/material.dart';

import 'app/base/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await appModule(AppEnv.prod);
  initFirebase();

  runApp(App());
}
