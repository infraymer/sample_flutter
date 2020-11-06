import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/material.dart';

class AddBankCardCell extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final Function onPressed;
  const AddBankCardCell({
    Key key,
    this.iconData,
    this.title,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: UiColors.main2,
            border: Border.all(width: 1, color: UiColors.border),
            borderRadius: BorderRadius.circular(6)),
        height: 86,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(children: <Widget>[
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: UiColors.additional),
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(iconData, size: 22, color: UiColors.additional)),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: basic14),
                    SizedBox(height: 2),
                    Text(subtitle, style: additional12),
                  ]),
            ),
            Icon(UiIcons.arrow, color: UiColors.additional)
          ]),
        ),
      ),
    );
  }
}
