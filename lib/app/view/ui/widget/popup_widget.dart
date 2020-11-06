import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/simple_button.dart';
import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  final String text;
  final Function funcNoBtn;
  final Function funcYesBtn;

  const PopupWidget({
    Key key,
    this.text,
    this.funcNoBtn,
    this.funcYesBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        padding: EdgeInsets.fromLTRB(36, 24, 36, 24),
        decoration: BoxDecoration(
          color: UiColors.main2,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          height: 140,
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(text, style: basic14, textAlign: TextAlign.center),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SimpleButton(
                      text: 'Нет',
                      onPressed: funcNoBtn,
                      isTransparent: true,
                    ),
                    SimpleButton(
                      text: 'Да',
                      onPressed: funcYesBtn,
                      isTransparent: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
