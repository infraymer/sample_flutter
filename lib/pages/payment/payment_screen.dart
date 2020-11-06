import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/pages/successful_payment/successful_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(
        title: Text('Оплата займа', style: basic14),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(UiIcons.shield, color: UiColors.green),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/visa_logo.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 22),
                Image.asset(
                  'assets/images/master_and_maestro.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 22),
                Image.asset(
                  'assets/images/mir-logo.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          buildCard(),
        ]),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      padding: EdgeInsets.fromLTRB(28, 16, 16, 24),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: UiColors.border),
          borderRadius: BorderRadius.circular(6),
          color: UiColors.main2),
      child: Column(
        children: <Widget>[
          AppTitleTextField(
            title: 'Номер карты',
            hintText: '1234 5678 9012 3456',
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              Container(
                width: 150,
                child: AppTitleTextField(
                  title: 'Срок действия',
                  hintText: '_ _  /  _ _',
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: 92,
                child: AppTitleTextField(
                  title: 'CVV',
                  hintText: '* * *',
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
          SizedBox(height: 16),
          AppTitleTextField(
            title: 'Имя владельца',
            hintText: 'Ivan Ivanov',
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(value: false, onChanged: (value) {}),
              Expanded(
                  child: Text('Запомнить данные для последующей оплаты',
                      style: basic14))
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: AppAccentButton(onPressed: () {
                Get.to(SuccessfulPaymentScreen());
              }, text: 'Оплатить'))
        ],
      ),
    );
  }
}
