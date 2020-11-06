import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:get/get.dart';

import 'info_about_you_controller.dart';

enum AboutYouTextFiled {
  fio,
  cityResidence,
  addressResidence,
  income,
  loanPayments,
  employerName,
  employesINN,
  workAddress,
  workPhone
}

class AboutYouItemData {
  AboutYouTextFiled type;
  String data;

  AboutYouItemData({
    this.type,
    this.data,
  });
}

class InfoAboutYouView extends GetView<InfoAboutYouController> {
  final array1 = [
    AboutYouTextFiled.fio,
    AboutYouTextFiled.cityResidence,
    AboutYouTextFiled.addressResidence
  ];
  final array2 = [AboutYouTextFiled.income, AboutYouTextFiled.loanPayments];
  final array3 = [
    AboutYouTextFiled.employerName,
    AboutYouTextFiled.workPhone,
    AboutYouTextFiled.workAddress,
    AboutYouTextFiled.employesINN
  ];

  @override
  Widget build(BuildContext context) {
    // controller.getApplicationInfo();
    return Scaffold(
      appBar: AppBar(title: Text('Информация о вас', style: basic14)),
      backgroundColor: UiColors.background,
      body: Obx(
        () => Column(children: [
          ProgressWidget(prosent: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: Wrap(runSpacing: 16, children: [
                for (final type in array1) createTitleTextField(type),
                Divider(),
                for (final type in array2) createTitleTextField(type),
                Divider(),
                for (final type in array3) createTitleTextField(type),
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

  Widget createTitleTextField(AboutYouTextFiled type) {
    var title = '';
    var hintText = '';
    var suffixIcon;
    var initionValue = '';
    var keyboardType = TextInputType.text;
    switch (type) {
      case AboutYouTextFiled.fio:
        title = 'Фамилия, имя, отчество';
        hintText = 'Иванов Иван Иванович';
        initionValue = controller.fullName.value;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          onChanged: (value) {
            controller.fullName.value = value;
            print(type);
          },
        );
      case AboutYouTextFiled.cityResidence:
        title = 'Город фактического проживания';
        hintText = 'г. Москва';
        initionValue = controller.cityResidence.value;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          onChanged: (value) {
            controller.cityResidence.value = value;
            print(type);
          },
        );
      case AboutYouTextFiled.addressResidence:
        title = 'Адрес фактического проживания';
        hintText = 'улица Виктора Королева, дом 4, кв 39';
        initionValue = controller.addressResidence.value;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          onChanged: (value) {
            controller.addressResidence.value = value;
          },
        );
      case AboutYouTextFiled.income:
        title = 'Ваш ежемесячный доход';
        hintText = 'Сумма';
        initionValue = controller.income.value;
        suffixIcon = Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            '₽',
            style: additional14,
          ),
        );
        keyboardType = TextInputType.number;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          onChanged: (value) {
            controller.income.value = value;
            print(type);
          },
        );
      case AboutYouTextFiled.loanPayments:
        title = 'Платежи по текущим кредитам';
        hintText = 'Сумма';
        initionValue = controller.loanPayments.value.toString();
        suffixIcon = Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            '₽',
            style: additional14,
          ),
        );
        keyboardType = TextInputType.number;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          inputFormatters: [MoneyInputFormatter()],
          onChanged: (value) {
            controller.loanPayments.value = double.parse(value, (_) => 0);
            print(type);
          },
        );
      case AboutYouTextFiled.employerName:
        // На 5s не влазит, поэтому перенос
        title = 'Наименования работодателя \n(необязательно)';
        hintText = 'Иванов Иван Иванович';
        initionValue = controller.employerName.value;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          onChanged: (value) {
            controller.employerName.value = value;
            print(type);
          },
        );
      case AboutYouTextFiled.employesINN:
        title = 'ИНН работадателя (необязательно)';
        hintText = 'Иванов Иван Иванович';
        initionValue = controller.employesINN.value;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          onChanged: (value) {
            controller.employesINN.value = value;
            print(type);
          },
        );
      case AboutYouTextFiled.workAddress:
        title = 'Адрес места работы (необязательно)';
        hintText = 'Улица Виктора Королева, дом 4 кв. 42';
        initionValue = controller.workAddress.value;
        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          onChanged: (value) {
            controller.workAddress.value = value;
            print(type);
          },
        );
      case AboutYouTextFiled.workPhone:
        title = 'Рабочий телефон (необязательно)';
        hintText = '+7 (913) 844-99-14';
        keyboardType = TextInputType.phone;
        initionValue = controller.workPhone.value;

        return AppTitleTextField(
          title: title,
          hintText: hintText,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          initialValue: initionValue,
          inputFormatters: [PhoneInputFormatter()],
          maxLength: 18,
          onChanged: (value) {
            controller.workPhone.value = '+' + toNumericString(value);
            print(type);
          },
        );
    }
    return SizedBox();
  }
}
