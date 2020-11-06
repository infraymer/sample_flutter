import 'package:animated/animated.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

class AppAccentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Icon icon;
  final double height;
  final double borderRadius;
  final FontWeight fontWeight;

  const AppAccentButton({
    Key key,
    this.text,
    @required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.height = 60,
    this.borderRadius = 6,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            child: Animated(
              value: !isLoading ? 1.0 : 0.0,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 100),
              builder: (context, child, animation) => Transform.scale(
                scale: animation.value,
                child: child,
              ),
              child: RaisedButton(
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                onPressed: onPressed,
                color: Theme.of(context).accentColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: basic14bold.copyWith(
                          fontWeight: FontWeight.bold,
                          color: UiColors.main1,
                        ),
                      ),
                    ),
                    if (icon != null) icon.paddingOnly(left: 10)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),
          Animated(
            value: isLoading ? 1.0 : 0.0,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 100),
            builder: (context, child, animation) => Transform.scale(
              scale: animation.value,
              child: child,
            ),
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
