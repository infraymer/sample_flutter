import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/text_field.dart';
import 'package:bibimoney/pages/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class ConfirmPhoneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: <Widget>[
              SizedBox(height: 32),
              Text('Подтвердить номер телефона', style: heading1),
              SizedBox(height: 8),
              Text('На ваш номер ${AuthController.to.phone.value} был отправлен СМС с кодом подтверждения', style: basic14),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: AppTextField(
                      hintText: '_ _ _ _ _ _',
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        AuthController.to.code.value = value;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  AppAccentButton(
                    onPressed: () => AuthController.to.accept(),
                    text: 'Подтвердить',
                  ),
                ],
              ),
              SizedBox(height: 22),
            ],
          ),
        ),
      ],
    );
  }
}
