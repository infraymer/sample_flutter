import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isTransparent;

  const SimpleButton({
    Key key,
    this.text,
    @required this.onPressed,
    this.isTransparent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      decoration: BoxDecoration(
        color: isTransparent ? UiColors.main2 : UiColors.accent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: UiColors.accent),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: basic12,
        ),
      ),
    );
  }
}
