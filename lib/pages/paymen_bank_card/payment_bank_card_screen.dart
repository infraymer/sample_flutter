import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/pages/payment/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentBankCardScreen extends StatefulWidget {
  PaymentBankCardScreen({Key key}) : super(key: key);

  @override
  _PaymentBankCardScreenState createState() => _PaymentBankCardScreenState();
}

class _PaymentBankCardScreenState extends State<PaymentBankCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(
        title: Text('Оплата банковской картой', style: basic14),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildMain(),
          ],
        ),
      ),
    );
  }

  Widget _buildMain() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: UiColors.border),
          borderRadius: BorderRadius.circular(6),
          color: UiColors.main2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppTitleTextField(
          title: 'Что оплачиваете',
        ),
        SizedBox(height: 8),
        AppTitleTextField(
          title: 'Сумма оплаты',
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '₽',
              style: additional14,
            ),
          ),
        ),
        SizedBox(height: 8),
        Wrap(
          runSpacing: 11,
          direction: Axis.horizontal, spacing: 14, children: [
          _ButtonTextUnderline(text: 'Ежемесячный платеж 8500 ₽'),
          _ButtonTextUnderline(text: 'Всю сумму 14 500 ₽'),
          _ButtonTextUnderline(text: 'Задолженность 8575 ₽'),
        ]),
        Container(
            margin: EdgeInsets.only(top: 16),
            width: double.infinity,
            child: AppAccentButton(onPressed: () {
              Get.to(PaymentScreen());
            }, text: 'К оплате'))
      ]),
    );
  }
}

class _ButtonTextUnderline extends StatelessWidget {
  final String text;
  const _ButtonTextUnderline({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: basic12.copyWith(
          color: UiColors.accentActive,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dotted,
        ),
      ),
    );
  }
}
