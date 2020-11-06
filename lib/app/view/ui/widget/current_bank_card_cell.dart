import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentBankCardCell extends StatelessWidget {
  final String title;
  final String subtitle;
  final String numberCard;
  final Function onPressedButton;

  const CurrentBankCardCell(
      {Key key,
      this.title,
      this.subtitle,
      this.numberCard,
      this.onPressedButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: UiColors.main2,
          border: Border.all(width: 1, color: UiColors.accentActive),
          borderRadius: BorderRadius.circular(6)),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: UiColors.additional),
                    borderRadius: BorderRadius.circular(20)),
                child:
                    Icon(UiIcons.card, size: 22, color: UiColors.additional)),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: basic14),
                    SizedBox(height: 2),
                    Text(subtitle, style: additional12),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                          text: numberCard ?? '',
                          style: basic14,
                          children: [
                            TextSpan(text: ' (ваша карта)', style: additional14)
                          ]),
                    )
                  ]),
            ),
          ]),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: Container(
              child: CupertinoButton(
                onPressed: onPressedButton,
                child: Text('Изменить', style: basic12.copyWith(color: UiColors.green)),
              ),
            ))
      ]),
    );
  }
}
