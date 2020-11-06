import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/empty_card.dart';
import 'package:bibimoney/app/view/ui/widget/icon_container.dart';
import 'package:bibimoney/app/view/ui/widget/list_tile_widget.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/invest_pages/sucessful_payment/successful_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class AboutCompanyInvestScreen extends StatefulWidget {
  AboutCompanyInvestScreen({Key key}) : super(key: key);

  @override
  _AboutCompanyInvestScreenState createState() =>
      _AboutCompanyInvestScreenState();
}

class _SalesData {
  _SalesData(this.month, this.sales);

  final String month;
  final double sales;
}

class _AboutCompanyInvestScreenState extends State<AboutCompanyInvestScreen> {
  List<bool> _selectPayTime = [true, false];
  List<bool> _selectInvestTime = [true, false, false];
  List<bool> _selectChart = [true, false, false];

  List<_SalesData> chart1Data = [
    _SalesData('Янв', 35),
    _SalesData('Фев', 28),
    _SalesData('Мар', 34),
    _SalesData('Апр', 32),
    _SalesData('Май', 40),
    _SalesData('Июн', 34),
    _SalesData('Июл', 32),
    _SalesData('Авг', 40),
    _SalesData('Сен', 40),
  ];

  List<_SalesData> chart2Data = [
    _SalesData('Янв', 40),
    _SalesData('Фев', 30),
    _SalesData('Мар', 21),
    _SalesData('Апр', 10),
    _SalesData('Май', 15),
    _SalesData('Июн', 34),
    _SalesData('Июл', 21),
    _SalesData('Авг', 27),
    _SalesData('Сен', 30),
  ];

  List<_SalesData> chart3Data = [
    _SalesData('Янв', 60),
    _SalesData('Фев', 30),
    _SalesData('Мар', 35),
    _SalesData('Апр', 40),
    _SalesData('Май', 37),
    _SalesData('Июн', 43),
    _SalesData('Июл', 55),
    _SalesData('Авг', 24),
    _SalesData('Сен', 36),
  ];

  @override
  Widget build(BuildContext context) {
    return buildTree();
  }

  Widget buildTree() {
    return Scaffold(
      backgroundColor: UiColors.background,
      body: ListView(
        children: [
          buildCardWithGraph(),
          buildCardUsefulMaterials(),
          buildCardAdvantages(),
          buildCardAbout(),
          buildCardCalculatePayments(),
        ],
      ),
    );
  }

  Widget buildCardWithGraph() {
    return Container(
      color: UiColors.main2,
      margin: EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          children: [
            Text(
              '550 000 ₽',
              style: basic14bold.copyWith(
                fontSize: 28.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text('Выручка компании за июнь', style: additional14),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                height: 218.0,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      // child: ChartWidget.withSampleData(),
                      // child: AppChart(),

                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          visibleMinimum: 1,
                          visibleMaximum: 4,
                        ),
                        // Chart title
                        title: ChartTitle(
                            text: _selectChart[0]
                                ? 'Портфель'
                                : _selectChart[1]
                                    ? 'Выручка'
                                    : 'Просрочка'),

                        // Enable legend
                        // legend: Legend(isVisible: true),
                        // Enable tooltip
                        // tooltipBehavior: TooltipBehavior(enable: true),

                        zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true,
                        ),

                        series: <ChartSeries<_SalesData, String>>[
                          ColumnSeries<_SalesData, String>(
                            dataSource: _selectChart[0]
                                ? chart1Data
                                : _selectChart[1]
                                    ? chart2Data
                                    : chart3Data,
                            xValueMapper: (_SalesData sales, _) => sales.month,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                            width: 0.3,
                            color: UiColors.accent,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            buildChartToggles(),
          ],
        ),
      ),
    );
  }

  Widget buildChartToggles() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ToggleButtons(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Портфель'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Выручка'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Просрочка'),
          ),
        ],
        isSelected: _selectChart,
        onPressed: (int index) {
          setState(() {
            for (var i = 0; i < _selectChart.length; i++) {
              if (i == index) {
                _selectChart[i] = true;
              } else {
                _selectChart[i] = false;
              }
            }
          });
        },
        fillColor: UiColors.accent,
        selectedColor: UiColors.main1,
        borderRadius: BorderRadius.circular(8),
        borderColor: UiColors.accent,
        selectedBorderColor: UiColors.accent,
        constraints: BoxConstraints(
          minWidth:
              (MediaQuery.of(context).size.width - 40) / _selectChart.length,
        ),
      ),
    );
  }

  Widget buildCardUsefulMaterials() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          AppListTileWidget(
            heading: 'Полезные материалы',
            textLeft: 'Презентация для инвесторов',
            suffixWidget: Icon(
              UiIcons.doc,
              color: UiColors.additional,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Итоги первого полугодия 2019-го',
            suffixWidget: Icon(
              UiIcons.doc,
              color: UiColors.additional,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Наши реквизиты',
            suffixWidget: Icon(
              UiIcons.doc,
              color: UiColors.additional,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Наш сайт bbmoney.ru',
            suffixWidget: Icon(
              UiIcons.arrow,
              color: UiColors.additional,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Клиентское приложение "БиБи Мани"',
            suffixWidget: Icon(
              UiIcons.arrow,
              color: UiColors.additional,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardAdvantages() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          AppListTileWidget(
            heading: 'Преимущества',
            textLeft: 'Инвестируйте с доходностью до 24% годовых',
            suffixWidget: SizedBox(),
            prefixWidget: AppIconContainerWidget(
              iconData: UiIcons.database,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Постоянный рост выручки с 2015 года',
            suffixWidget: SizedBox(),
            prefixWidget: AppIconContainerWidget(
              iconData: UiIcons.grow,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Все инвестиции обеспечены залоговым имуществом',
            suffixWidget: SizedBox(),
            prefixWidget: AppIconContainerWidget(
              iconData: UiIcons.shield,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Работаем по всей России',
            suffixWidget: SizedBox(),
            prefixWidget: AppIconContainerWidget(
              // TODO: Опять какой-то косяк с иконкой
              iconData: UiIcons.world,
            ),
          ),
          AppListTileWidget(
            textLeft: 'Ежемесячные выплаты процентов',
            suffixWidget: SizedBox(),
            prefixWidget: AppIconContainerWidget(
              iconData: UiIcons.card,
            ),
          ),
        ],
      ),
    );
  }

  Container buildCardAbout() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      color: UiColors.main2,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('О компании', style: basic14bold),
                Transform.rotate(
                  angle: 90 * math.pi / 180,
                  child: Icon(
                    UiIcons.arrow,
                    color: UiColors.additional,
                  ),
                ),
              ],
            ),
            Text(
              'Случаются обстоятельства, срочно требуется определенная сумма денег. В таких случаях имеет смысл прибегнуть к краткосрочному кредитованию, когда можно получить срочный кредит на выгодных условиях в автоломбарде под залог личного авто. Многим эта схема кажется рискованной и это действительно может быть так, если вы обращаетесь к непроверенным компаниям. Мы работаем на рынке не первый год и все наши отзывы - настоящие.',
              style: basic14.copyWith(
                height: 1.86,
              ),
            ),
            SizedBox(height: 30),
            Text(
              '"БиБи Мани Автозаймы" - это лучшие условия и максимальная выгода. Ваше время и комфорт важны для нас - мы подберем для Вас оптимальный вариант займа и сбережём ваше время. Наши клиенты возвращаются к нам снова, а также советуют нас своим друзьям.',
              style: basic14.copyWith(
                height: 1.86,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCardCalculatePayments() {
    return Container(
      color: UiColors.main2,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmptyCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '120 00 ₽',
                          style: basic14bold.copyWith(
                            fontSize: 28.0,
                          ),
                        ),
                        Text('Ваша доходность', style: basic14),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '30%',
                        style: basic14bold.copyWith(
                          fontSize: 28.0,
                        ),
                      ),
                      Text('Годовая ставка', style: basic14),
                    ],
                  ),
                ],
              ),
            ),
            buildPayTimeToggles(),
            buildInvestTimeToggles(),
            Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 6.0),
              child: AppTitleTextField(
                title: 'Сумма оплаты',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    '₽',
                    style: additional14,
                  ),
                ),
                initialValue: '100 000',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: double.infinity,
                child: AppAccentButton(
                  text: 'Отправить заявку',
                  onPressed: () {
                    Get.to(SuccessfulPaymentScreen());
                  },
                ),
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Посмотреть условия займа',
                  style: basic12.copyWith(
                    color: UiColors.accentActive,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPayTimeToggles() {
    return Padding(
      padding: EdgeInsets.only(top: 18.0, bottom: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text('Срок выплаты', style: basic14),
          ),
          ToggleButtons(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Ежемесячно'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('В конце года'),
              ),
            ],
            isSelected: _selectPayTime,
            onPressed: (int index) {
              setState(() {
                for (var i = 0; i < _selectPayTime.length; i++) {
                  if (i == index) {
                    _selectPayTime[i] = true;
                  } else {
                    _selectPayTime[i] = false;
                  }
                }
              });
            },
            fillColor: UiColors.accent,
            selectedColor: UiColors.main1,
            borderRadius: BorderRadius.circular(8),
            borderColor: UiColors.accent,
            selectedBorderColor: UiColors.accent,
            constraints: BoxConstraints(
              minWidth: (MediaQuery.of(context).size.width - 40) /
                  _selectPayTime.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInvestTimeToggles() {
    return Padding(
      padding: EdgeInsets.only(top: 18.0, bottom: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text('Срок инвестиций', style: basic14),
          ),
          ToggleButtons(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('12 мес.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('24 мес.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('36 мес.'),
              ),
            ],
            isSelected: _selectInvestTime,
            onPressed: (int index) {
              setState(() {
                for (var i = 0; i < _selectInvestTime.length; i++) {
                  if (i == index) {
                    _selectInvestTime[i] = true;
                  } else {
                    _selectInvestTime[i] = false;
                  }
                }
              });
            },
            fillColor: UiColors.accent,
            selectedColor: UiColors.main1,
            borderRadius: BorderRadius.circular(8),
            borderColor: UiColors.accent,
            selectedBorderColor: UiColors.accent,
            constraints: BoxConstraints(
              minWidth: (MediaQuery.of(context).size.width - 40) /
                  _selectInvestTime.length,
            ),
          ),
        ],
      ),
    );
  }
}
