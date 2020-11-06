import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/list_tile_widget.dart';
import 'package:flutter/material.dart';

class AboutInvestmentScreen extends StatelessWidget {
  const AboutInvestmentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(
        title: Text(
          'Инвестиция от 14 июня, 2020',
          style: basic14SemiBold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: buildTree(),
      ),
    );
  }

  Widget buildTree() {
    return ListView(
      children: [
        AppListTileWidget(
          heading: 'Информация об инвестиции',
          textLeft: 'Сумма инвестиций',
          textRight: '100 000 ₽',
        ),
        AppListTileWidget(
          textLeft: 'Срок инвестиций',
          textRight: '12 месяцев',
        ),
        AppListTileWidget(
          textLeft: 'Конец срока',
          textRight: '14 июля, 2020 г.',
        ),
        AppListTileWidget(
          textLeft: 'Процентная ставка',
          textRight: '13%',
        ),
        AppListTileWidget(
          textLeft: 'Получение дохода',
          textRight: 'Ежемесячно',
        ),
        AppListTileWidget(
          textLeft: 'Дата выплаты процентов',
          textRight: 'Каждое 15-е число',
        ),
        AppListTileWidget(
          textLeft: 'Инвестор',
          textRight: 'Уоррен Эдвард Баффет',
        ),
        SizedBox(height: 8.0),
        AppListTileWidget(
          heading: 'Ваши реквизиты',
          textLeft: 'БИК банка получателя',
          textRight: '123871283123',
        ),
        AppListTileWidget(
          textLeft: 'Банковский счет',
          textRight: '12037182414',
        ),
        SizedBox(height: 8.0),
        // TODO: Сделать кликабельным по договору
        AppListTileWidget(
          heading: 'Документы',
          textLeft: 'Договор',
          suffixWidget: Container(
            alignment: Alignment.topRight,
            child: Icon(UiIcons.doc, color: UiColors.additional),
          ),
        ),
        AppListTileWidget(
          textLeft: 'Условия для инвестиций',
          suffixWidget: Container(
            alignment: Alignment.topRight,
            child: Icon(UiIcons.doc, color: UiColors.additional),
          ),
        ),
      ],
    );
  }
}
