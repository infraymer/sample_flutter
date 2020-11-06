import 'package:bibimoney/app/base/app_env.dart';
import 'package:bibimoney/firebase.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_stetho/flutter_stetho.dart';
import 'app/base/app_module.dart';
import 'app/view/app_invest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Stetho.initialize();
  await appModule(AppEnv.demo);
  // initFirebase();

  runApp(AppInvest());
}
