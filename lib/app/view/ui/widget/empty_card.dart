import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  final Widget child;
  final bool withPadding;
  final bool withArrow;
  final bool withCenterArrow;
  final Color arrowColor;
  const EmptyCard({
    Key key,
    this.child,
    this.withArrow = false,
    this.withCenterArrow = false,
    this.arrowColor = UiColors.additional,
    this.withPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        color: UiColors.main2,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: UiColors.border),
      ),
      child: withPadding
          ? Padding(
              padding: EdgeInsets.fromLTRB(18.0, 24.0, 18.0, 24.0),
              child: Row(
                // Это сделано для того, чтобы стрелка вставала по центру карточки, но это заденет и child widget.
                // По идее, можно и так оставить, но если вдруг разные выравнивания контента внутри карточки (не по центру) - придется писать свою карточку)
                crossAxisAlignment: withCenterArrow
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: child),
                  withArrow || withCenterArrow
                      ? Icon(UiIcons.arrow, color: arrowColor)
                      : SizedBox(),
                ],
              ),
            )
          : Row(
              crossAxisAlignment: withCenterArrow
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: child),
                withArrow || withCenterArrow
                    ? Icon(UiIcons.arrow, color: arrowColor)
                    : SizedBox(),
              ],
            ),
    );
  }
}
