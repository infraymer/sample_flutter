import 'package:flutter/material.dart';

class AppTitleTextView extends StatelessWidget {
  final String title;
  final String value;
  final bool smallTitle;

  const AppTitleTextView({Key key, this.title, this.value, this.smallTitle = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallStyle = Theme.of(context)
        .textTheme
        .subtitle2
        .copyWith(fontWeight: FontWeight.bold);
    final bigStyle = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: smallTitle ? smallStyle : bigStyle),
        SizedBox(height: 6),
        Text(value,
            style: Theme.of(context)
                .textTheme
                .subtitle1)
      ],
    );
  }
}
