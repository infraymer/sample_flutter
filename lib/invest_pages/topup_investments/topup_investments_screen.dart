import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/list_tile_widget.dart';
import 'package:flutter/material.dart';

class TopupIvestmentsScreen extends StatelessWidget {
  const TopupIvestmentsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(
        title: Text(
          'Пополнить инвестиции',
          style: basic14SemiBold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
        Container(
          color: UiColors.main2,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Чтобы пополнить инвестиции, переведите любым удобным способом нужную сумму на наш расчётный счёт. Реквизиты для перевода указаны ниже',
            ),
          ),
        ),
        SizedBox(height: 8.0),
        AppListTileWidget(
          heading: 'Банковские реквизиты',
          textLeft: 'Банк',
          textRight: 'Название банка',
        ),
        AppListTileWidget(
          textLeft: 'Расчетный счет',
          textRight: '123',
        ),
        AppListTileWidget(
          textLeft: 'Корреспондентский счет',
          textRight: '456',
        ),
        AppListTileWidget(
          textLeft: 'БИК',
          textRight: '789',
        ),
        SizedBox(height: 8.0),
        AppListTileWidget(
          textLeft: 'Наименование организации',
          textRight: 'ООО "Витязь"',
        ),
        AppListTileWidget(
          textLeft: 'Юридический адрес',
          textRight:
              '665816, Иркутская область, город Ангарск, улица Норильская (Старица Мкр), дом 45',
        ),
        AppListTileWidget(
          textLeft: 'Фактический адрес',
          textRight: 'Ангарск, 30 микрорайон, дом 9',
        ),
        AppListTileWidget(
          textLeft: 'ОГРН',
          textRight: '1193850019296',
        ),
        AppListTileWidget(
          textLeft: 'Дата регистрации',
          textRight: '03.07.2019',
        ),
        AppListTileWidget(
          textLeft: 'ИНН',
          textRight: '3801148702',
        ),
        AppListTileWidget(
          textLeft: 'КПП',
          textRight: '380101001',
        ),
      ],
    );
  }
}
