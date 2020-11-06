import 'package:bibimoney/app/view/ui/res/app_icons.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/button_field.dart';
import 'package:flutter/material.dart';

class DateTimeDeliveryField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final icon = Icon(AppIcons.arrow, color: UiColors.main1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Когда доставить', style: UiStyles.title(context)),
        SizedBox(height: 6),
        AppButtonField(
          text: 'Завтра, 24 мая',
          suffixIcon: icon,
        ),
        SizedBox(height: 8),
        AppButtonField(
          text: '8:00 - 16:00',
          suffixIcon: icon,
        ),
      ],
    );
  }
}
