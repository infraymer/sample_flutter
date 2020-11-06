import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

class RequiredDocData {
  final String title;
  final String subtitle;
  final Image image;
  final Widget imageWidget;

  final Function onTap;

  RequiredDocData(
      {this.title, this.subtitle, this.onTap, this.image, this.imageWidget});
}

class RequiredDocWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image image;
  final Function onTap;
  final Widget imageWidget;
  const RequiredDocWidget(
      {Key key,
      this.title,
      this.subtitle,
      this.image,
      this.onTap,
      this.imageWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 86,
        decoration: BoxDecoration(
            color: UiColors.main2,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: UiColors.border)),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(title, style: basic14),
                    if (subtitle != null) Text(subtitle, style: additional12),
                  ])),
              image == null && imageWidget == null
                  ? Icon(UiIcons.plus_circle)
                  : imageWidget == null
                      ? Container(height: 62, width: 62, child: image)
                      : imageWidget
            ],
          ),
        ),
      ).paddingOnly(top: 2, bottom: 2),
    );
  }
}
