import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key key}) : super(key: key);

  AuthController get _controller => AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход в приложение', style: UiStyles.title(context)),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) return _buildProgress();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            AppTitleTextField(
              title: 'Номер вашего телефона',
              hintText: '+7 (123) 456-78-90',
              // initialValue: formatToPhoneMask(AuthController.to.phone?.value ?? ''),
              keyboardType: TextInputType.phone,
              inputFormatters: [PhoneInputFormatter()],
              maxLength: 18,
              onChanged: (value) {
                _controller.phone.value = '+' + toNumericString(value);
              },
            ),
            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                  text:
                      'Нажимая «Выслать код подтверждения» вы даёте согласие на обработку ',
                  style: basic12,
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('tap on textspan');
                          launch('http://zevshelp.ru/pr');
                        },
                      text: 'персональных данных',
                      style: basic12.copyWith(
                        color: Get.theme.accentColor,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted,
                      ),
                    )
                  ]),
            ),
            !_controller.isLoading.value
                ? Container(
                    margin: EdgeInsets.only(top: 16),
                    width: double.infinity,
                    child: AppAccentButton(
                      text: 'Выслать код подтверждения',
                      onPressed: () async {
                        await _controller.sendCode();
                      },
                    ))
                : Container(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  )
          ]),
        );
      }),
    );
  }

  Widget _buildProgress() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
