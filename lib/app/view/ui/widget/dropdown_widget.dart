import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

// Для элемента выпадающего списка
class SelectMenuItem {
  int value;
  String name;

  SelectMenuItem(this.value, this.name);
}

////////

class DropdownWidget extends StatelessWidget {
  final SelectMenuItem selected;
  final Function onChange;
  final List<DropdownMenuItem<SelectMenuItem>> items;

  const DropdownWidget({Key key, this.selected, this.onChange, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // color: Colors.cyan,
        border: Border.all(width: 1, color: UiColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selected,
          items: items,
          onChanged: onChange,
        ),
      ),
    );
  }
}
