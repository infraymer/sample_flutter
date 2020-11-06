import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:flutter/material.dart';

class AddBancCardNumber extends StatelessWidget {
  final Function onPressedButton;
  const AddBancCardNumber({Key key, this.onPressedButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
          color: UiColors.main2,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1, color: UiColors.border)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 24, 18, 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Номер банковской карты для перевода',
            style: basic14,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18),
          AppTitleTextField(
            hintText: '---- ---- ---- ----',
            title: 'Номер банковской карты',
            controller: textController,
            maxLength: 16,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 18),
          Container(
              width: double.infinity,
              child: AppAccentButton(
                  onPressed: () {
                    onPressedButton(textController.text);
                  },
                  text: 'Сохранить'))
        ]),
      ),
    );
  }
}
