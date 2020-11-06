import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:get/get.dart';

import '../additional_contacts/additional_contacts_controller.dart';

class AdditionalDataItem {
  AdditionalConstactsType type;
  String data;
  AdditionalDataItem({
    this.type,
    this.data,
  });
}

enum AdditionalConstactsType { contactName, byWhom, contactPhone }

class AdditionalContactsView extends GetView<AdditionalContactsController> {
  final typeTextFields = [
    AdditionalConstactsType.contactName,
    AdditionalConstactsType.byWhom,
    AdditionalConstactsType.contactPhone
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Дополнительные контакты', style: basic14)),
      backgroundColor: UiColors.background,
      body: Obx(
        () => Column(children: [
          ProgressWidget(prosent: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: Wrap(runSpacing: 16, children: [
                for (final type in typeTextFields) createTitleTextField(type),
                Container(height: 40)
              ])),
            ),
          ),
          Container(
            width: double.infinity,
            child: SafeArea(
              child: AppAccentButton(
                borderRadius: 0,
                text: 'Продолжить',
                icon: Icon(Icons.arrow_forward),
                onPressed:
                    controller.isValid ? () => controller.nextPage() : null,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget createTitleTextField(AdditionalConstactsType type) {
    var title = '';
    var hintText = '';
    var suffixIcon;
    var keyboardType = TextInputType.text;
    switch (type) {
      case AdditionalConstactsType.contactName:
        title = 'Имя контактного лица';
        hintText = 'Имя';
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: controller.contactName.value,
          onChanged: (value) {
            controller.contactName.value = value;
            print(type);
          },
        );
      case AdditionalConstactsType.byWhom:
        title = 'Кем приходится';
        hintText = 'Выберите статус';

        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: controller.byWhom.value,
          onChanged: (value) {
            controller.byWhom.value = value;
          },
        );
      case AdditionalConstactsType.contactPhone:
        return AppTitleTextField(
          title: 'Номер телефона контактного лица',
          hintText: '+7 (913) 844-99-14 ',
          suffixIcon: suffixIcon,
          keyboardType: TextInputType.phone,
          initialValue: controller.contactPhone.value,
          inputFormatters: [PhoneInputFormatter()],
          maxLength: 18,
          onChanged: (value) {
            controller.contactPhone.value = '+' + toNumericString(value);
          },
        );
    }

    return SizedBox();
  }
}
