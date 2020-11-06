import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key key,
      this.title,
      this.description,
      this.descriptionColor,
      this.onTap})
      : super(key: key);
  final String title;
  final String description;
  final Color descriptionColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: basic14),
                  if (description != null)
                    Text(description,
                        style: additional14.copyWith(
                            color: descriptionColor == null
                                ? UiColors.additional
                                : descriptionColor))
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios,
                color: UiColors.placeholder, size: 14),
          ]),
        ),
      ),
    );
  }
}
