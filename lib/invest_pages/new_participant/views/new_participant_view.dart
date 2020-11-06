import 'package:bibimoney/app/base/util/mask.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/invest_pages/new_participant/controllers/new_participant_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';

class NewParticipantView extends GetView<NewParticipantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Новый участник',
          style: basic14SemiBold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      AppTitleTextField(
                        title: 'Как к вам обращаться',
                        hintText: 'Иван',
                        initialValue: controller.name?.value ?? '',
                        onChanged: (value) {
                          controller.name.value = value;
                        },
                      ),
                      SizedBox(height: 16.0),
                      AppTitleTextField(
                        title: 'Ваша почта',
                        hintText: 'ivanov@mail.ru',
                        keyboardType: TextInputType.emailAddress,
                        initialValue: controller.email?.value ?? '',
                        onChanged: (value) {
                          controller.email.value = value;
                        },
                      ),
                      SizedBox(height: 16.0),
                      AppTitleTextField(
                        title: 'Телефон',
                        hintText: '+7 (123) 456-78-90',
                        initialValue:
                            formatToPhoneMask(controller.phone?.value ?? ''),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [PhoneInputFormatter()],
                        onChanged: (value) {
                          controller.phone.value = '+' + toNumericString(value);
                        },
                      ),
                      SizedBox(height: 16.0),
                      AppTitleTextField(
                        title: 'Придумайте пароль',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isSecret.value =
                                !controller.isSecret.value;
                          },
                          child: controller.isSecret.value
                              ? Icon(Icons.remove_red_eye)
                              : Icon(UiIcons.eye_off),
                        ),
                        obscureText: controller.isSecret.value,
                        onChanged: (text) {
                          controller.password.value = text;
                        },
                      ),
                      SizedBox(height: 16.0),
                      AppTitleTextField(
                        title: 'Повторите пароль',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isSecret.value =
                                !controller.isSecret.value;
                          },
                          child: controller.isSecret.value
                              ? Icon(Icons.remove_red_eye)
                              : Icon(UiIcons.eye_off),
                        ),
                        obscureText: controller.isSecret.value,
                        onChanged: (text) {
                          controller.repeatedPassword.value = text;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        child: AppAccentButton(
                          text: 'Создать профиль',
                          onPressed: controller.checkConditions()
                              ? () {
                                  // Get.to(GreetingScreen());
                                  controller.registration();
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
