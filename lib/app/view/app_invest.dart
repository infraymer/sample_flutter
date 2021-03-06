import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInvest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: UiColors.accent,
        accentColor: UiColors.accent,
      ),
      transitionDuration: Duration(milliseconds: 150),
      getPages: AppPages.routes,
      initialRoute: Routes.ROOT_INVEST,
    );
  }
}
