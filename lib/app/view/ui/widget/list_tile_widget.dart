import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class AppListTileWidget extends StatelessWidget {
  final String heading;
  final String textLeft;
  final String textRight;
  // Если он есть - он заменяет собой textRight
  final Widget suffixWidget;
  final Widget prefixWidget;
  final bool withBorders;

  const AppListTileWidget({
    Key key,
    this.heading,
    @required this.textLeft,
    this.textRight = '',
    this.suffixWidget,
    this.prefixWidget,
    this.withBorders = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UiColors.main2,
        border:
            withBorders ? Border.all(color: UiColors.border, width: 0.5) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (heading != null)
              Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Text(heading, style: basic14bold),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                prefixWidget != null
                    ? Row(
                        children: [
                          prefixWidget,
                          SizedBox(
                            width: 14.0,
                          ),
                        ],
                      )
                    : SizedBox(),
                Expanded(
                  child: Text(textLeft, style: basic14),
                ),
                suffixWidget ??
                    Expanded(
                      child: Text(textRight,
                          style: basic14, textAlign: TextAlign.end),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
