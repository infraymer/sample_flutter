import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/add_bank_card_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibimoney/pages/new_loan/add_card/add_card_controller.dart';

class AddCardView extends GetView<AddCardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(title: Text('Банковская карта', style: basic14)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            AddBancCardNumber(
              onPressedButton: (value) {
                print(value);
                Get.back(result: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
