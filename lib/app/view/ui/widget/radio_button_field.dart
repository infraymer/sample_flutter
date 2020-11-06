import 'package:bibimoney/app/view/ui/res/colors.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';

class AppRadioButtonField extends StatefulWidget {
  final String text;
  final Widget prefixIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const AppRadioButtonField(
      {Key key,
      this.text,
      this.prefixIcon,
      this.isSelected = false,
      this.onTap})
      : super(key: key);

  @override
  _AppRadioButtonFieldState createState() => _AppRadioButtonFieldState();
}

class _AppRadioButtonFieldState extends State<AppRadioButtonField> {
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
        await Future.delayed(Duration(milliseconds: 100));
        _active = false;
        setState(() {});

        widget.onTap?.call();
      },
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 48,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          padding: EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: widget.isSelected || _active
                  ? Theme.of(context).accentColor
                  : AppColor.textFieldBorder,
              width: widget.isSelected || _active ? 1.5 : 1,
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
              SizedBox(width: 8),
              Icon(
                widget.isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 20,
                color: widget.isSelected
                    ? Theme.of(context).accentColor
                    : Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
