import 'package:flutter/material.dart';

class AppGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppGradientButton({Key key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow,
                Colors.black,
              ],
              // TODO: Нет этих цветов))
              // colors: [
              //   UiColors.gradientButtonStart,
              //   UiColors.gradientButtonEnd
              // ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Container(
          constraints: BoxConstraints(minHeight: 60.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
