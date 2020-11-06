import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';

class SecondAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final ShapeBorder shape;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final String textTitle;
  final String textSubitle;

  SecondAppBar({
    Key key,
    this.textTitle,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation = 1,
    this.shape,
    this.backgroundColor = Colors.white,
    this.brightness = Brightness.light,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle = true,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.textSubitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: textTitle != null
          ? Column(
              children: <Widget>[
                Text(
                  textTitle,
                  style: basic14bold,
                ),
                if (textSubitle != null)
                  Text(
                    textSubitle,
                    style:
                        basic14bold.apply(color: Theme.of(context).accentColor),
                  )
              ],
            )
          : title,
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation,
      shape: shape,
      backgroundColor: backgroundColor,
      brightness: brightness,
      iconTheme: iconTheme ?? IconThemeData(color: Colors.black),
      actionsIconTheme: actionsIconTheme ?? IconThemeData(color: Colors.black),
      textTheme: textTheme,
      primary: primary,
      centerTitle: centerTitle ?? false,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
    );
    return appbar;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}
