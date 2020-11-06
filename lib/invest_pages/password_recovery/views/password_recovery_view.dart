import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/invest_pages/password_recovery/controllers/password_recovery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecoveryView extends GetView<PasswordRecoveryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Восстановление пароля',
          style: basic14SemiBold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: Obx(
            () => Column(
              children: [
                Text(
                  'Напишите почту которую вы указывали при регистрации. На неё мы отправим письмо для установления нового пароля.',
                  style: basic14,
                ),
                SizedBox(height: 16.0),
                AppTitleTextField(
                  title: 'Почта при регистрации',
                  hintText: 'ivanov@mail.ru',
                  onChanged: (value) {
                    controller.email.value = value;
                  },
                ),
                SizedBox(height: 24.0),
                Container(
                  width: double.infinity,
                  child: AppAccentButton(
                    text: 'Сброс пароля',
                    onPressed: controller.email.value != ''
                        ? () {
                            controller.resetPassword();
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
