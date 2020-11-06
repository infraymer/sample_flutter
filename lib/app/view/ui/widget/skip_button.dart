import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  const SkipButton({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UiColors.main2,
        border: Border.symmetric(
            vertical: BorderSide(width: 1, color: UiColors.border)),
      ),
      height: 60,
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(title, style: additional14),
      ),
    );
  }
}
