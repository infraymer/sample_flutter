import 'package:bibimoney/app/controllers/api_controller.dart';
import 'package:bibimoney/app/interactor/application/user_interactor.dart';
import 'package:bibimoney/pages/about_app/about_app_screen.dart';
import 'package:bibimoney/pages/about_company/about_company_screen.dart';
import 'package:bibimoney/pages/auth/auth_screen.dart';
import 'package:bibimoney/pages/autopay/autopay_connected_screen.dart';
import 'package:bibimoney/pages/chat/chat_screen.dart';
import 'package:bibimoney/pages/pay_method/pay_method_screen.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cells/exit_menu_item.dart';
import 'cells/menu_item.dart';
import 'cells/profile_menu_item.dart';

enum MenuItems {
  payment,
  avtopayment,
  aboutCompany,
  chatWithManager,
  aboutApp,
  offices,
  exit
}

class MenuController extends GetxController {
  static MenuController to = Get.find();
  // final UserInteractor _userInteractor = Get.find();
  final List<MenuItems> paymentItems = [
    MenuItems.payment,
    MenuItems.avtopayment
  ];
  final List<MenuItems> menuItems = [
    MenuItems.aboutCompany,
    MenuItems.chatWithManager,
    MenuItems.aboutApp,
    MenuItems.offices
  ];

  Future<void> tapOnItemMenu(MenuItems item) async {
    switch (item) {
      case MenuItems.payment:
        //TODO
        Get.to(PayMethodScreen());
        break;
      case MenuItems.avtopayment:
        Get.to(AutopayConnectedScreen());
        //TODO
        break;
      case MenuItems.aboutCompany:
        Get.to(AboutCompanyScreen());
        break;
      case MenuItems.aboutApp:
        Get.to(AboutAppScreen());
        break;
      case MenuItems.exit:
        await ApiController.to.logout();
        // Get.offAll(AuthScreen());
        break;
      case MenuItems.chatWithManager:
        Get.to(ChatScreen());
        break;
      case MenuItems.offices:
        Get.toNamed(Routes.OFFICES);
        break;
    }
  }

  String getItemName(MenuItems item) {
    switch (item) {
      case MenuItems.payment:
        return 'Способ оплаты';
        break;
      case MenuItems.avtopayment:
        return 'Автоплатежи';
        break;
      case MenuItems.aboutCompany:
        return 'О компании';
        break;
      case MenuItems.chatWithManager:
        return 'Чат с менеджером';
        break;
      case MenuItems.aboutApp:
        return 'О приложении';
        break;
      case MenuItems.offices:
        return 'Наши офисы';
      default:
        return '';
        break;
    }
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = MenuController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(children: [
                ProfileMenuItem(),
                for (final item in controller.paymentItems)
                  MenuItem(
                      title: controller.getItemName(item),
                      onTap: () {
                        Navigator.pop(context);
                        controller.tapOnItemMenu(item);
                        print(item);
                      }),
                Divider(),
                for (final item in controller.menuItems)
                  MenuItem(
                    title: controller.getItemName(item),
                    onTap: () {
                      Navigator.pop(context);
                      controller.tapOnItemMenu(item);
                      print(item);
                    },
                  ),
                Divider(),
                ExitItemMenu(onTap: () {
                  controller.tapOnItemMenu(MenuItems.exit);
                })
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 42),
              child: Image.asset('assets/images/menu-logo.png'),
            )
          ]),
    );
  }
}
