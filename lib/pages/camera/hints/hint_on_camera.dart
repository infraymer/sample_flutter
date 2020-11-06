import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class HitCamera extends StatelessWidget {
  final String text;
  final Function onTapButton;
  final String imagePath;
  final bool widePhoto;

  const HitCamera({
    Key key,
    this.text,
    this.onTapButton,
    this.imagePath,
    this.widePhoto = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UiColors.main1.withAlpha(200),
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 40, 16, 40),
          height: 450,
          width: 280,
          decoration: BoxDecoration(
            color: UiColors.main2,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widePhoto
                  ? Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 40),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.fromLTRB(36, 40, 36, 40),
                      child: Image.asset(imagePath),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.0),
                child: Text(
                  text,
                  style: basic14,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(36, 20, 36, 20),
                height: 48,
                width: 256,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: UiColors.border),
                ),
                child: FlatButton(
                    onPressed: onTapButton,
                    child: Text('Понятно', style: basic14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
