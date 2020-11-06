import 'package:flutter/material.dart';

class AppOutlineAccentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppOutlineAccentButton({
    Key key,
    this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      onPressed: onPressed,
      color: Theme.of(context).accentColor,
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
      ),
      borderSide: BorderSide(color: Theme.of(context).accentColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
