import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class ExitItemMenu extends StatelessWidget {
  const ExitItemMenu({Key key, this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 19, 16),
        child: Row(
          children: <Widget>[
            Icon(Icons.exit_to_app, color: UiColors.placeholder),
            SizedBox(width: 8),
            Text('Выход', style: basic14)
          ],
        ),
      ),
    );
  }
}
