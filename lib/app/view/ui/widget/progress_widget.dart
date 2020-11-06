import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int prosent;
  const ProgressWidget({Key key, this.prosent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      child: Row(
        children: [
          Expanded(
            flex: prosent,
            child: Container(color: UiColors.green),
          ),
          Expanded(
            flex: 100 - prosent,
            child: Container(color: UiColors.border),
          ),
        ],
      ),
    );
  }
}