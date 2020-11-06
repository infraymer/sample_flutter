import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibimoney/invest_pages/password_send/controllers/password_send_controller.dart';

class PasswordSendView extends GetView<PasswordSendController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Пароль отправлен',
          style: basic14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Image.asset('assets/images/email_checked.png'),
                SizedBox(height: 30),
                Text.rich(
                  TextSpan(
                    text: 'На вашу почту ',
                    style: basic14.copyWith(height: 1.5),
                    children: [
                      TextSpan(
                        text: controller.email.value,
                        style: basic14.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' отправлено письмо с вашим паролем. Не забудьте проверить в папке "Спам".',
                        style: basic14.copyWith(height: 1.5),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              child: AppAccentButton(
                text: 'Продолжить',
                onPressed: () {
                  Get.toNamed(Routes.AUTHORIZATION);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
