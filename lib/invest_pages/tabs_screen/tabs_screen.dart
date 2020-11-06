import 'package:bibimoney/app/view/ui/res/colors.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/invest_pages/about_company_invest/about_company_invest_screen.dart';
import 'package:bibimoney/invest_pages/bottom_sheet/bottom_sheet_part.dart';
import 'package:bibimoney/invest_pages/investor_office/investor_office_screen.dart';
import 'package:bibimoney/invest_pages/tabs_screen/presenter/tabs_controller.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsScreen extends StatefulWidget {
  static const tabs = <Widget>[
    Tab(
        child: Text(
      'Кабинет инвестора',
      textAlign: TextAlign.center,
    )),
    Tab(
        child: Text(
      'О компании',
      textAlign: TextAlign.center,
    )),
  ];

  const TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: TabsScreen.tabs.length, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // TODO: UiIcons.user какая-то битая
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Get.toNamed(Routes.PROFILE);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(UiIcons.phone_call_1),
            onPressed: () {
              // Get.to(NotificationsScreen());
              // Get.bottomSheet(
              //   BottomSheetPart(),
              //   backgroundColor: UiColors.main2,
              // );
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    height: 250.0,
                    color: Color(0xFF737373),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: BottomSheetPart(),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
        // TODO: Не знаю как поступить, но Expanded тут не срабатывает. Вышло не совсем по дизайну
        // title: Text('БиБи.Мани \nинвестиции', style: UiStyles.title(context)),
        title: Text('БиБи.Мани инвестиции',
            maxLines: 1, overflow: TextOverflow.fade),
        centerTitle: true,
        backgroundColor: AppColor.accent,
        bottom: TabBar(
          indicatorColor: UiColors.main1,
          labelStyle: basic12.copyWith(fontWeight: FontWeight.bold),
          labelColor: UiColors.main1,
          tabs: TabsScreen.tabs,
          controller: _tabController,
          onTap: (index) {
            TabsController.to.tabIndex.value = index;
          },
        ),
      ),
      // drawer: Drawer(
      //   child: MenuScreen(),
      // ),
      body: Obx(
        () => IndexedStack(
          index: TabsController.to.tabIndex.value,
          children: <Widget>[
            InvestorOfficeScreen(),
            AboutCompanyInvestScreen(),
          ],
        ),
      ),
    );
  }
}
