import 'package:animated/animated.dart';
import 'package:flutter/material.dart';

class AppIconAccentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final bool isLoading;

  const AppIconAccentButton({
    Key key,
    @required this.onPressed,
    @required this.iconData,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Animated(
          value: !isLoading ? 1.0 : 0.0,
          curve: Curves.easeOutBack,
          duration: Duration(milliseconds: 300),
          builder: (context, child, animation) => Transform.scale(
            scale: animation.value,
            child: child,
          ),
          child: RaisedButton(
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 12),
            onPressed: onPressed,
            color: Theme.of(context).accentColor,
            child: Icon(iconData, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
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
    );
  }
}
