import 'package:bibimoney/app/view/ui/res/app_icons.dart';
import 'package:bibimoney/app/view/ui/res/colors.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;

  const NotificationWidget({Key key, this.iconData, this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColor.warning,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(iconData ?? AppIcons.wating, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
