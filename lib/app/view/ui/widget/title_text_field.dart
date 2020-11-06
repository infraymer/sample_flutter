import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTitleTextField extends StatefulWidget {
  final String initialValue;
  final String value;
  final String title;
  final String hintText;
  final int maxLength;
  final FocusNode focusNode;
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
  final ValueChanged<String> onSubmitted;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final InputCounterWidgetBuilder buildCounter;
  final String description;
  final String linkName;
  final Function linkAction;

  const AppTitleTextField({
    Key key,
    @required this.title,
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
    this.value = '',
    this.initialValue,
    this.focusNode,
    this.onSubmitted,
    this.description,
    this.linkName,
    this.linkAction,
  }) : super(key: key);

  @override
  _AppTitleTextFieldState createState() => _AppTitleTextFieldState();
}

class _AppTitleTextFieldState extends State<AppTitleTextField> {
  FocusNode localFocusNode;
  TextEditingController localController;

  FocusNode get currentFocusNode => widget.focusNode ?? localFocusNode;

  TextEditingController get currentController =>
      widget.controller ?? localController;

  @override
  void initState() {
    if (widget.focusNode == null) localFocusNode = FocusNode();
    if (widget.controller == null) localController = TextEditingController();

    if (widget.initialValue != null)
      currentController.value = TextEditingValue(text: widget.initialValue);

    currentFocusNode.addListener(() {
      setState(() {});
    });

    if (widget.onChanged != null) {
      currentController.addListener(() {
        widget.onChanged(currentController.text);
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    localController?.dispose();
    localFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: UiColors.border);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: borderSide,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Text(widget.title, style: basic14),
                SizedBox(width: 5),
                if (widget.description != null)
                  Text(widget.description, style: additional14),
              ],
            ),
            if (widget.linkName != null)
              GestureDetector(
                onTap: widget.linkAction ?? () {},
                child: Text(
                  widget.linkName,
                  style: basic12.copyWith(
                    color: UiColors.accentActive,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 6),
        TextField(
          onSubmitted: widget.onSubmitted,
          focusNode: currentFocusNode,
          enabled: widget.enabled,
          maxLength: widget.maxLength,
          controller: currentController,
          keyboardType: widget.keyboardType,
          autofocus: widget.autofocus,
          inputFormatters: widget.inputFormatters,
          obscureText: widget.obscureText,
          minLines: widget.minLines,
          onTap: widget.onTap,
          buildCounter: widget.buildCounter,
          maxLines: widget.maxLines,
          textCapitalization: widget.textCapitalization,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.white,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            border: border,
            enabledBorder: border,
            focusColor: Theme.of(context).primaryColor,
            hintText: widget.hintText,
            labelText: widget.labelText,
            contentPadding:
                EdgeInsets.only(bottom: 14, top: 14, left: 14, right: 14),
          ),
        ),
      ],
    );
  }
}
