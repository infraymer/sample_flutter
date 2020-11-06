import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/material.dart';

class CameraHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const CameraHeader({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.black54,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Stack(
        children: [
          Center(
            child: subtitle != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )
                : Text(
                    title ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Icon(
              UiIcons.help,
              color: UiColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
