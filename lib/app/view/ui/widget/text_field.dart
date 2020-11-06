import 'package:bibimoney/app/view/ui/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final int maxLength;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final bool enabled;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String labelText;
  final GestureTapCallback onTap;
  final ValueChanged<String> onChanged;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final InputCounterWidgetBuilder buildCounter;

  const AppTextField({
    Key key,
    this.hintText,
    this.controller,
    this.inputFormatters,
    this.maxLength,
    this.keyboardType,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.labelText,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.buildCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: AppColor.textFieldBorder);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: borderSide,
    );

    return TextField(
      enabled: enabled,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      minLines: minLines,
      onTap: onTap,
      buildCounter: buildCounter,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: border,
        enabledBorder: border,
        focusColor: Theme.of(context).primaryColor,
        hintText: hintText,
        labelText: labelText,
        contentPadding:
        EdgeInsets.only(bottom: 12, top: 12, left: 16, right: 16),
      ),
    );
  }
}