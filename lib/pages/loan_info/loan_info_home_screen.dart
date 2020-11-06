import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/pages/home/presentation/home_controller.dart';
import 'package:bibimoney/pages/payment_history/payment_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'documents/loan_documents_screen.dart';
import 'loan_info_screen.dart';

class LoanInfoHomeScreen extends StatefulWidget {
  static const tabs = <Widget>[
    Tab(
        child: Text(
      'Информация',
      textAlign: TextAlign.center,
    )),
    Tab(
        child: Text(
      'История оплаты',
      textAlign: TextAlign.center,
    )),
    Tab(
        child: Text(
      'Документы',
      textAlign: TextAlign.center,
    )),
  ];

  const LoanInfoHomeScreen({Key key}) : super(key: key);

  @override
  LoanInfoHomeScreenState createState() => LoanInfoHomeScreenState();
}

class LoanInfoHomeScreenState extends State<LoanInfoHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: LoanInfoHomeScreen.tabs.length,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Передавать данные
        title: Text('Займ от 7.07.2020', style: basic14),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: UiColors.main1,
          labelStyle: basic12.copyWith(fontWeight: FontWeight.bold),
          labelColor: UiColors.main1,
          tabs: LoanInfoHomeScreen.tabs,
          controller: _tabController,
          onTap: (index) {
            HomeController.to.tabIndex.value = index;
          },
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: HomeController.to.tabIndex.value,
          children: <Widget>[
            LoanInfo(),
            PaymentHistoryScreen(),
            LoanDocementsScreen()
          ],
        ),
      ),
    );
  }
}
