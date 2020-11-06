import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;
  final Color startColor;
  final Color endColor;

  const SupportButton(
      {Key key,
      this.iconData,
      this.text,
      this.onPressed,
      this.startColor,
      this.endColor})
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
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Container(
          constraints: BoxConstraints(minHeight: 50.0),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              Align(
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
            ],
          ),
        ),
      ),
    );
  }
}
