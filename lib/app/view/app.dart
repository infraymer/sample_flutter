import 'package:bibimoney/app/controllers/api_controller.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/generated/locales.g.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(ApiController.client),
      child: GetMaterialApp(
        title: 'БиБи Money',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: UiColors.accent,
          accentColor: UiColors.accent,
        ),
        transitionDuration: Duration(milliseconds: 150),
        translationsKeys: AppTranslation.translations,
        getPages: AppPages.routes,
        initialRoute: Routes.ROOT,
      ),
    );
  }
}
