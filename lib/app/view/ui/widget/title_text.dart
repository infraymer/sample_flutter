import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold));
  }
}
