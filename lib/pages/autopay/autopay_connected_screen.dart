import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_autopay_screen.dart';

class AutopayConnectedScreen extends StatelessWidget {
  const AutopayConnectedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ваши автоплатежи', style: basic14),
        centerTitle: true,
      ),
      backgroundColor: UiColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // TODO: Сделать переход (клик) по карточке
                    EmptyCard(
                      child: AutopayData(
                        payDate: '7 августа',
                        paySumm: '8 500 ₽',
                        cardNumber: '4859',
                      ),
                      withArrow: true,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: AppAccentButton(
                  text: 'Создать новый автоплатеж',
                  onPressed: () {
                    Get.to(NewAutopayScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AutopayData extends StatelessWidget {
  final String payDate;
  final String paySumm;
  final String cardNumber;
  const AutopayData({
    Key key,
    this.payDate,
    this.paySumm,
    this.cardNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Согласно графику платежей',
          style: basic16.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 12.0),
        Text('Следующий платеж: $payDate', style: additional14),
        Row(
          children: <Widget>[
            Text('$paySumm в месяц  **** $cardNumber', style: additional14),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Image.asset(
                  'assets/images/pay_systems/small/visa_small_icon.png'),
            ),
          ],
        ),
      ],
    );
  }
}
