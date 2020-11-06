import 'package:bibimoney/app/base/util/mask.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/app_divider.dart';
import 'package:bibimoney/app/view/ui/widget/list_tile_widget.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/invest_pages/profile/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ваш профиль',
          style: basic14SemiBold,
        ),
      ),
      backgroundColor: UiColors.background,
      body: SafeArea(
        child: Obx(
          () => ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
                child: AppTitleTextField(
                  title: 'Как к вам обращаться',
                  hintText: 'Сергей',
                  initialValue: controller.name?.value ?? '',
                  onChanged: (value) {
                    controller.name.value = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: AppTitleTextField(
                  title: 'Почта',
                  hintText: 'serge***ail.com',
                  keyboardType: TextInputType.emailAddress,
                  initialValue: controller.email?.value ?? '',
                  onChanged: (value) {
                    controller.email.value = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: AppTitleTextField(
                  title: 'Телефон',
                  hintText: '+7 *** *** 33 03',
                  initialValue:
                      formatToPhoneMask(controller.phone?.value ?? ''),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [PhoneInputFormatter()],
                  onChanged: (value) {
                    controller.phone.value = '+' + toNumericString(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                child: AppDivider(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: AppTitleTextField(
                  title: 'Текущий пароль',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.isSecretPassword.value =
                          !controller.isSecretPassword.value;
                    },
                    child: controller.isSecretPassword.value
                        ? Icon(Icons.remove_red_eye)
                        : Icon(UiIcons.eye_off),
                  ),
                  obscureText: controller.isSecretPassword.value,
                  onChanged: (text) {
                    controller.password.value = text;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: AppTitleTextField(
                  title: 'Новый пароль',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.isSecretNewPassword.value =
                          !controller.isSecretNewPassword.value;
                    },
                    child: controller.isSecretNewPassword.value
                        ? Icon(Icons.remove_red_eye)
                        : Icon(UiIcons.eye_off),
                  ),
                  obscureText: controller.isSecretNewPassword.value,
                  onChanged: (text) {
                    controller.newPassword.value = text;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 28.0),
                width: double.infinity,
                child: AppAccentButton(
                  text: 'Обновить пароль',
                  onPressed: controller.checkPassword() ? () {} : null,
                ),
              ),
              AppListTileWidget(
                heading: 'Уведомления',
                textLeft: 'Поступление средств на счет',
                suffixWidget: CupertinoSwitch(
                  value: controller.incomeCash.value,
                  activeColor: UiColors.accent,
                  onChanged: (value) {
                    controller.incomeCash.value = value;
                  },
                ),
              ),
              AppListTileWidget(
                textLeft: 'Сообщение в чате от менеджера',
                suffixWidget: CupertinoSwitch(
                  value: controller.withMessages.value,
                  activeColor: UiColors.accent,
                  onChanged: (value) {
                    controller.withMessages.value = value;
                  },
                ),
              ),
              AppListTileWidget(
                textLeft: '🔥 Выгодные предложения',
                suffixWidget: CupertinoSwitch(
                  value: controller.withOffers.value,
                  activeColor: UiColors.accent,
                  onChanged: (value) {
                    controller.withOffers.value = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 27.0),
                child: FlatButton(
                  onPressed: () {
                    controller.signOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        UiIcons.logout,
                        color: UiColors.error,
                      ),
                      SizedBox(width: 13.0),
                      Text(
                        'Выход',
                        style: basic14.copyWith(
                          color: UiColors.error,
                        ),
                      ),
                    ],
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
