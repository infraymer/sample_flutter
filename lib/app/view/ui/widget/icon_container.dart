import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class AppIconContainerWidget extends StatelessWidget {
  final IconData iconData;

  const AppIconContainerWidget({
    Key key,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: 41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: UiColors.accent,
      ),
      child: Icon(iconData),
    );
  }
}
