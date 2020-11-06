import 'dart:io';

import 'package:bibimoney/app/controllers/controllers.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/title_loan_info.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:bibimoney/pages/new_loan/additional_contacts/additional_contacts_view.dart';
import 'package:bibimoney/pages/new_loan/info_about_you/info_about_you_view.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'check_info_loan_controller.dart';

class CheckInfoLoanView extends GetView<CheckInfoLoanController> {
  UsersSetInput get user => controller.applicationInteractor.application.user;

  CreditsInsertInput get credit =>
      controller.applicationInteractor.application.credit;

  Map<DocumentTypeEnum, String> get files =>
      controller.applicationInteractor.files;

  bool Function(DocumentTypeEnum) get isValidFile =>
      controller.applicationInteractor.isValidFile;

  Image Function(DocumentTypeEnum) get getImage =>
      controller.applicationInteractor.getImage;

  @override
  Widget build(BuildContext context) {
    // controller.getApplicationInfo();
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(
        title: Text('Проверка информации', style: basic14),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
                ProgressWidget(prosent: 100),
                _buildTitle(),
                _buildInfoAboutYou(),
                Divider(height: 5),
                _buildAdditionalContacts(),
                Divider(height: 5),
                _buildPasportData(),
                Divider(height: 5),
                _buildAutoDocumentsData(),
                Divider(height: 5),
                _buildCardInfo(),
                Divider(height: 5),
                _buildPhotoAndVideoAuto(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppAccentButton(
                      onPressed: controller.isValid
                          ? () => controller.createApplication()
                          : null,
                      text: 'Отправить заявку'),
                )
              ]),
      ),
    );
  }

  Widget _buildTitle() {
    return ContainerWithButtonChange(
      onTapChange: () {
        Get.toNamed(Routes.NEW_LOAN);
      },
      child: Container(
        width: double.infinity,
        child: TitleLoanInfo(
          amount: '100 000',
          term: '5',
          monthlyPayment: '20 000',
          padding: EdgeInsets.only(top: 5, bottom: 24),
        ),
      ),
    );
  }

  Widget _buildInfoAboutYou() {
    final data = [
      AboutYouItemData(
        type: AboutYouTextFiled.fio,
        data: user.fullName,
      ),
      AboutYouItemData(
        type: AboutYouTextFiled.cityResidence,
        data: user.city,
      ),
      AboutYouItemData(
          type: AboutYouTextFiled.addressResidence, data: user.address),
      AboutYouItemData(
        type: AboutYouTextFiled.income,
        data: user.displayName,
      ),
      AboutYouItemData(
        type: AboutYouTextFiled.loanPayments,
        data: credit.otherPayments?.toString() ?? '',
      ),
      AboutYouItemData(
        type: AboutYouTextFiled.employerName,
        data: credit.work.data.name ?? '',
      ),
      AboutYouItemData(
        type: AboutYouTextFiled.employesINN,
        data: credit.work.data.inn ?? '',
      ),
      AboutYouItemData(
        type: AboutYouTextFiled.workAddress,
        data: credit.work.data.address ?? '',
      ),
    ];
    return ContainerWithButtonChange(
      onTapChange: () {
        Get.toNamed(Routes.INFO_ABOUT_YOU);
      },
      title: 'Информация о вас',
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (final item in data)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _buildAboutYouRow(item),
              )
          ]),
        ),
      ),
    );
  }

  Widget _buildAboutYouRow(AboutYouItemData item) {
    switch (item.type) {
      case AboutYouTextFiled.fio:
        return TextWithTitle(title: 'Фамилия, имя, отчество', text: item.data);
      case AboutYouTextFiled.cityResidence:
        return TextWithTitle(
            title: 'Город фактического проживания', text: item.data);
      case AboutYouTextFiled.addressResidence:
        return TextWithTitle(
            title: 'Адрес фактического проживания', text: item.data);
      case AboutYouTextFiled.income:
        return TextWithTitle(title: 'Ваш ежемесячный доход', text: item.data);
      case AboutYouTextFiled.loanPayments:
        return TextWithTitle(
            title: 'Платежи по текущим кредитам', text: item.data);
      case AboutYouTextFiled.employerName:
        return TextWithTitle(
            title: 'Наименования работадателя', text: item.data);
      case AboutYouTextFiled.employesINN:
        return TextWithTitle(title: 'ИНН работадателя', text: item.data);
      case AboutYouTextFiled.workAddress:
        return TextWithTitle(title: 'Адрес места работы', text: item.data);
      case AboutYouTextFiled.workPhone:
        return TextWithTitle(title: 'Рабочий телефон', text: item.data);
    }
    return null;
  }

  Widget _buildRowAdditionalContacts(AdditionalDataItem item) {
    switch (item.type) {
      case AdditionalConstactsType.contactName:
        return TextWithTitle(title: 'Имя контактного лица', text: item.data);
      case AdditionalConstactsType.byWhom:
        return TextWithTitle(title: 'Кем приходится', text: item.data);
      case AdditionalConstactsType.contactPhone:
        return TextWithTitle(title: 'Номер контактного лица', text: item.data);
    }
    return null;
  }

  Widget _buildAdditionalContacts() {
    final data = [
      AdditionalDataItem(
          type: AdditionalConstactsType.contactName,
          data: credit.contact.data.name ?? ''),
      AdditionalDataItem(
          type: AdditionalConstactsType.byWhom,
          data: credit.contact.data.whoIs ?? ''),
      AdditionalDataItem(
          type: AdditionalConstactsType.contactPhone,
          data: credit.contact.data.phoneNumber ?? '')
    ];
    return ContainerWithButtonChange(
      title: 'Дополнительный контакт',
      onTapChange: () {
        Get.toNamed(Routes.ADDITIONAL_CONTACTS);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (final item in data)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _buildRowAdditionalContacts(item),
              )
          ]),
        ),
      ),
    );
  }

  Widget _buildPasportData() {
    return ContainerWithButtonChange(
      title: 'Фото паспортных данных',
      onTapChange: () {
        Get.toNamed(Routes.PASSPORT_DATA);
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 23, left: 16, right: 16),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            spacing: 8,
            children: [
              DocumentTypeEnum.passportSelfie,
              DocumentTypeEnum.passportPhotoFirstPage,
              DocumentTypeEnum.passportPhotoFamily,
              DocumentTypeEnum.passportPhotoRegistration,
            ]
                .map((e) => isValidFile(e)
                    ? Container(
                        color: Colors.red,
                        width: 54,
                        height: 54,
                        child: getImage(e),
                      )
                    : null)
                .where((element) => element != null)
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildAutoDocumentsData() {
    return ContainerWithButtonChange(
      title: 'Фото ПТС и СТС',
      onTapChange: () {
        Get.toNamed(Routes.AUTO_DATA);
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 23, left: 16, right: 16),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            spacing: 8,
            children: [
              DocumentTypeEnum.autoPhotoSts,
              DocumentTypeEnum.autoPhotoStsBack,
              DocumentTypeEnum.autoPhotoPts,
              DocumentTypeEnum.autoPhotoPtsBack,
            ]
                .map((e) => isValidFile(e)
                    ? Container(
                        color: Colors.red,
                        width: 54,
                        height: 54,
                        child: getImage(e),
                      )
                    : null)
                .where((element) => element != null)
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCardInfo() {
    return ContainerWithButtonChange(
        title: 'Способ получения денег',
        onTapChange: () {
          Get.toNamed(Routes.RECIVING_MONEY);
        },
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: TextWithTitle(
                title: 'Номер банковской карты', text: credit.cardNumber ?? ''),
          ),
        ));
  }

  Widget _buildPhotoAndVideoAuto() {
    if (!GetUtils.isNullOrBlank(credit.autoInfo) ||
        isValidFile(DocumentTypeEnum.autoVideo360) ||
        isValidFile(DocumentTypeEnum.autoPhotoVin)) {
      return ContainerWithButtonChange(
        title: 'Фото и видео автомобиля',
        onTapChange: () {
          Get.toNamed(Routes.PHOTO_AND_VIDEO_AUTO);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text('Пожалуйста, заполните всю информацию!'),
        ),
      );
    }
    return ContainerWithButtonChange(
      title: 'Фото и видео автомобиля',
      onTapChange: () {
        Get.toNamed(Routes.PHOTO_AND_VIDEO_AUTO);
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 23, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextWithTitle(
                  title: 'Марка, модель, год автомобиля',
                  text: credit.autoInfo ?? ''),
              SizedBox(height: 16),
              Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                spacing: 8,
                children: [
                  if (isValidFile(DocumentTypeEnum.autoPhotoVin))
                    Container(
                      width: 54,
                      height: 54,
                      color: UiColors.accent,
                      child: Icon(
                        UiIcons.video,
                      ),
                    ),
                  if (isValidFile(DocumentTypeEnum.autoPhotoVin))
                    Container(
                      width: 54,
                      height: 54,
                      child: getImage(DocumentTypeEnum.autoPhotoVin),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerWithButtonChange extends StatelessWidget {
  final Widget child;
  final String title;
  final Function onTapChange;
  const ContainerWithButtonChange(
      {Key key, this.child, this.title, this.onTapChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UiColors.main2,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Text(title ?? '', style: basic14)),
                CupertinoButton(
                  onPressed: onTapChange,
                  child: Text('Изменить',
                      style: basic14.copyWith(color: UiColors.accentActive)),
                )
              ],
            ),
          ),
          if (child != null) child
        ],
      ),
    );
  }
}

class TextWithTitle extends StatelessWidget {
  final String title;
  final String text;
  const TextWithTitle({Key key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: additional14),
          SizedBox(height: 4),
          Text(text, style: basic14),
        ],
      ),
    );
  }
}
