import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/pages/home/view/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndLoanScreen extends StatelessWidget {
  const EndLoanScreen({Key key}) : super(key: key);

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
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                    'Спасибо за заявку! Наш менеджер свяжется с вами в течение 15 минут',
                    textAlign: TextAlign.center,
                    style: basic16),
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
                  Get.offAll(HomeScreen());
                },
                text: 'На главную'),
          ),
        )
      ],
    ));
  }
}
