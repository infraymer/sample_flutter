import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class AppButtonField extends StatefulWidget {
  final String text;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const AppButtonField(
      {Key key,
      this.text,
      this.prefixIcon,
      this.suffixIcon,
      this.isSelected = false,
      this.onTap})
      : super(key: key);

  @override
  _AppButtonFieldState createState() => _AppButtonFieldState();
}

class _AppButtonFieldState extends State<AppButtonField> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _active = true;
        setState(() {});
      },
      onTapUp: (_) {
        _active = false;
        setState(() {});
      },
      onTapCancel: () {
        _active = false;
        setState(() {});
      },
      onTap: () async {
        _active = true;
        setState(() {});
        await Future.delayed(Duration(milliseconds: 200));
        _active = false;
        setState(() {});

        widget.onTap?.call();
      },
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 48,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: widget.isSelected || _active
                  ? Theme.of(context).accentColor
                  : UiColors.border,
              width: widget.isSelected || _active ? 2 : 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.prefixIcon ?? SizedBox(),
              SizedBox(width: widget.prefixIcon != null ? 8 : 4),
              Expanded(
                child: Text(
                  widget.text ?? '',
                  maxLines: 1,
                  style: basic16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: widget.suffixIcon != null ? 8 : 4),
              widget.suffixIcon ?? SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
