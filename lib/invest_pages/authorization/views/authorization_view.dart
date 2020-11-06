import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/invest_pages/authorization/controllers/authorization_controller.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorizationView extends GetView<AuthorizationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset('assets/images/menu-logo.png'),
              ),
              Column(
                children: [
                  Text(
                    'Личный кабинет инвестора',
                    style: basic16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                    child: AppTitleTextField(
                      title: 'Ваша почта',
                      hintText: 'ivanov@mail.ru',
                      onChanged: (value) {
                        controller.email.value = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                    child: Obx(
                      () => AppTitleTextField(
                        title: 'Пароль',
                        hintText: 'Пароль от кабинета',
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
                        linkName: 'Забыли пароль?',
                        linkAction: () {
                          Get.toNamed(Routes.PASSWORD_RECOVERY);
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: AppAccentButton(
                      text: 'Войти',
                      onPressed: () {
                        // Get.to(TabsScreen());
                        controller.sigin();
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: UiColors.main2,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 1, color: UiColors.border),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Get.toNamed(Routes.NEW_PARTICIPANT);
                      },
                      child: Text(
                        'Я новый участник',
                        textAlign: TextAlign.center,
                        style: basic14,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 24.0),
                child: Container(
                  width: double.infinity,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: UiColors.main2,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1, color: UiColors.accentActive),
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          UiIcons.doc,
                          color: UiColors.accentActive,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Презентация для инвестора',
                            style: basic14.copyWith(
                              color: UiColors.accentActive,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dashed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
