import 'package:bibimoney/app/view/ui/res/colors.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/pages/home/presentation/home_controller.dart';
import 'package:bibimoney/pages/loans/loans_screen.dart';
import 'package:bibimoney/pages/menu/menu.dart';
import 'package:bibimoney/pages/payment_history/payment_history_screen.dart';
import 'package:bibimoney/pages/support/view/ui/screen/support_screen.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const tabs = <Widget>[
    Tab(
        child: Text(
      'Ваши деньги',
      textAlign: TextAlign.center,
    )),
    Tab(
        child: Text(
      'История оплаты',
      textAlign: TextAlign.center,
    )),
    Tab(
        child: Text(
      'Помощь',
      textAlign: TextAlign.center,
    )),
  ];

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: HomeScreen.tabs.length, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(UiIcons.notification),
              onPressed: () {
                Get.toNamed(Routes.NOTIFICATION_LIST);
              })
        ],
        backgroundColor: AppColor.accent,
        bottom: TabBar(
          indicatorColor: UiColors.main1,
          labelStyle: basic12.copyWith(fontWeight: FontWeight.bold),
          labelColor: UiColors.main1,
          tabs: HomeScreen.tabs,
          controller: _tabController,
          onTap: (index) {
            HomeController.to.tabIndex.value = index;
          },
        ),
      ),
      drawer: Drawer(
        child: MenuScreen(),
      ),
      body: Obx(
        () => IndexedStack(
          index: HomeController.to.tabIndex.value,
          children: <Widget>[
            LoansScreen(),
            PaymentHistoryScreen(),
            SupportScreen(),
          ],
        ),
      ),
    );
  }
}

class LoanScreen {}

class Destination {
  const Destination(this.title, this.icon);

  final String title;
  final IconData icon;
}
