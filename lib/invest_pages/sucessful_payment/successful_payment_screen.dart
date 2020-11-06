import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/invest_pages/tabs_screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessfulPaymentScreen extends StatelessWidget {
  const SuccessfulPaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset('assets/images/end_loan.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 30, 30, 5),
                child: Text(
                  'Мы уже читаем вашу заявку!',
                  style: basic14bold.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Мы перезвоним вам в течение 15 минут чтобы ответить на ваши вопросы и рассказать как внести инвестицию',
                  textAlign: TextAlign.center,
                  style: additional14,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
            child: AppAccentButton(
                onPressed: () {
                  Get.offAll(TabsScreen());
                },
                text: 'На главную'),
          ),
        )
      ],
    ));
  }
}
