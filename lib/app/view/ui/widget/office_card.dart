import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/simple_button.dart';
import 'package:flutter/material.dart';

class OfficeCard extends StatelessWidget {
  final String officeAddress;
  final String phoneNumber;
  final String schedule;
  final Function onPressedNumber;
  final Function onPressedBtn;
  const OfficeCard({
    Key key,
    this.officeAddress,
    this.phoneNumber,
    this.schedule,
    this.onPressedNumber,
    this.onPressedBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: UiColors.main2,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: UiColors.border),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 20.0, 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(officeAddress, style: basic14bold),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: onPressedNumber,
                child: Text(
                  phoneNumber,
                  style: basic14.copyWith(color: UiColors.accentActive),
                ),
              ),
              Text(schedule, style: basic14),
              SizedBox(height: 20),
              SimpleButton(
                text: 'Проложить маршрут',
                onPressed: onPressedBtn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
