import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/add_bank_card_cell.dart';
import 'package:bibimoney/app/view/ui/widget/current_bank_card_cell.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/pages/new_loan/add_card/add_card_view.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibimoney/pages/new_loan/reciving_money/reciving_money_controller.dart';

class RecivingMoneyView extends GetView<RecivingMoneyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(
        title: Text('Получение денег', style: basic14),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ProgressWidget(prosent: 75),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                Obx(() => controller.cardNumber.value == '' ||
                        controller.cardNumber.value == null
                    ? GestureDetector(
                        onTap: () async {
                          final result = await Get.to(AddCardView());
                          if (result != null) {
                            controller.cardNumber.value = result;
                          }
                        },
                        child: AddBankCardCell(
                          iconData: UiIcons.card,
                          title: 'Банковская карта',
                          subtitle: 'Получите деньги на вашу банковскую карту',
                        ),
                      )
                    : CurrentBankCardCell(
                        title: 'Банковская карта',
                        subtitle: 'Получите деньги на вашу банковскую карту',
                        numberCard: controller.cardNumber.value,
                        onPressedButton: () async {
                          // Get.to(AddCardScreen());
                          controller.cardNumber.value =
                              await Get.toNamed(Routes.ADD_CARD);
                        },
                      )),
              ],
            ),
          )),
          // SkipButton(title: 'Заполнить эту информацию позже'),
          Container(
            width: double.infinity,
            child: SafeArea(
              child: Obx(
                () => AppAccentButton(
                  borderRadius: 0,
                  text: 'Продолжить',
                  icon: Icon(Icons.arrow_forward),
                  onPressed:
                      controller.isValid ? () => controller.nextPage() : null,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
