import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: <Widget>[
              SizedBox(height: 32),
              Text('login'.tr, style: heading1),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  AppAccentButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: 'Не отменять',
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: AppTextButton(
                      onPressed: () {},
                      text: 'Да, отменить заказ',
                    ),
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
