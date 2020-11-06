import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/pages/home/view/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessfulPaymentScreen extends StatelessWidget {
  const SuccessfulPaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/successful_payment.png'),
              SizedBox(height: 42.0),
              Column(
                children: <Widget>[
                  Text('Оплата прошла успешно!',
                      style: basic16.copyWith(fontSize: 18)),
                  SizedBox(height: 15.0),
                  Text(
                      'Перевод может занять до 3-х дней, \nв зависимости от банка отправителя',
                      style: additional14),
                ],
              ),
              SizedBox(height: 42.0),
              Container(
                width: double.infinity,
                child: AppAccentButton(
                  onPressed: () {
                    Get.offAll(HomeScreen());
                  },
                  text: 'На главную',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
