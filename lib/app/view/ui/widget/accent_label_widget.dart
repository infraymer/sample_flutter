import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';

class AccentLabelWidget extends StatelessWidget {
  final String value;

  const AccentLabelWidget({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.all(8),
        child: Text(
          value ?? '',
          style: basic14bold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
