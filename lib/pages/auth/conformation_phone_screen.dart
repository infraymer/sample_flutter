import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';

class ConformationPhoneScreen extends StatelessWidget {
  ConformationPhoneScreen({Key key}) : super(key: key);

  AuthController get _controller => AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Потдтверждение номера', style: UiStyles.title(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_controller.isLoading.value) return _buildProgress();
          return Column(children: [
            RichText(
                textAlign: TextAlign.center,
                text:
                    TextSpan(text: 'на ваш номер ', style: basic14, children: [
                  TextSpan(text: _controller.phone.value, style: basic14bold),
                  TextSpan(
                      text: ' отправлено смс с кодом подтверждения',
                      style: basic14),
                ])),
            SizedBox(height: 16),
            AppTitleTextField(
              title: 'Введите код из смс',
              hintText: '- - - - - -',
              maxLength: 6,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _controller.code.value = value;
                if (value.length == 6) {
                  if (!_controller.isLoading.value &&
                      !_controller.isAuthorized.value)
                    _controller.signInWithPhoneNumber();
                }
              },
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              child:
                  AppAccentButton(onPressed: () {}, text: 'Отправить еще раз'),
            ),
            SizedBox(height: 8),
            Obx(() => Visibility(
                  visible: AuthController.to.isLoading.value,
                  child: Center(child: CircularProgressIndicator()),
                ))
          ]);
        }),
      ),
    );
  }

  Widget _buildProgress() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
