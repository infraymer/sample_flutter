import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/slider_style.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/pages/new_loan/widgets/monthly_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';

import 'new_loan_controller.dart';

class NewLoanView extends GetView<NewLoanController> {
  @override
  Widget build(BuildContext context) {
    // controller.getApplicationInfo();
    return Scaffold(
      appBar: AppBar(title: Text('Новый займ', style: basic14)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => ListView(
            children: <Widget>[
              MonthlyPayment(
                      price: controller.monthlyPayment.round().toString())
                  .paddingOnly(bottom: 16, top: 24),
              AppTitleTextField(
                title: 'Сумма денег',
                initialValue: controller.loanAmount.value.toInt() > 0
                    ? controller.loanAmount.value.toInt().toString()
                    : '',
                // initialValue: controller.loanAmount.value,
                keyboardType: TextInputType.number,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    '₽',
                    style: additional14,
                  ),
                ),
                onChanged: (value) =>
                    controller.loanAmount.value = double.parse(value),
              ).paddingOnly(bottom: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: AppTitleTextField(
                      hintText: controller.loanTerm.value.round().toString(),
                      title: 'Срок',
                      enabled: false,
                      suffixIcon: Text('Месяцев',
                              style:
                                  basic14.copyWith(color: UiColors.placeholder))
                          .paddingOnly(right: 14, top: 14, bottom: 14),
                    ),
                  ),
                  Expanded(
                    child: FlutterSlider(
                      values: [controller.loanTerm.value],
                      max: 100,
                      min: 1,
                      handler: sliderHandler(context),
                      trackBar: sliderTrackBar(context),
                      onDragging: (handlerIndex, lowerValue, upperValue) =>
                          controller.loanTerm.value = lowerValue,
                    ).paddingOnly(top: 16),
                  ),
                ],
              ).paddingOnly(bottom: 36),
              AppAccentButton(
                text: 'Заполнить анкету',
                onPressed: controller.isValid ? controller.nextPage : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
