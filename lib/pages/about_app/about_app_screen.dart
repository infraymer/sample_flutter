import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PackageInfo packageInfo = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('О приложении', style: basic14)),
      body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/menu-logo.png').paddingOnly(top: 50),
            Text(
              'Версия ${packageInfo.version}',
              style: additional12,
              textAlign: TextAlign.center,
            ).paddingOnly(bottom: 58),
            Container(
                width: double.infinity, height: 1, color: UiColors.border),
            AboutAppCell(
              title: 'Политика конфеденциальности',
            ),
            AboutAppCell(
              title: 'Пользовательскное соглашение',
            ),
            Container(
                    margin: EdgeInsets.all(16),
                    width: double.infinity,
                    child: AppAccentButton(
                        onPressed: () {}, text: 'Написать разработчикам'))
                .paddingOnly(top: 30),
            Text(
              'ЗАО "Ди энд Пи" ИНН 2464237412, ОГРН 1112468056095, номер в реестре МФО 671303504002627. Все права соблюдены. «БиБи Мани» © 2020. Головной офис: г. Иркутск, ул. Фурье, 1Г.',
              style: additional12,
              textAlign: TextAlign.center,
            ).paddingAll(16)
          ]),
    );
  }
}

class AboutAppCell extends StatelessWidget {
  final String title;
  final Function onTap;
  const AboutAppCell({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: UiColors.border))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(title, style: basic14)),
            Icon(UiIcons.arrow, size: 20, color: UiColors.additional)
          ],
        ),
      ),
    );
  }
}
