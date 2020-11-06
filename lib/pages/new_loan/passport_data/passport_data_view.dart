import 'dart:io';

import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/image_with_count.dart';
import 'package:bibimoney/app/view/ui/widget/list_of_required_documents.dart';
import 'package:bibimoney/app/view/ui/widget/popup_widget.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/required_doc_widget.dart';
import 'package:bibimoney/app/view/ui/widget/take_photo.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../passport_data/passport_data_controller.dart';

class PassportDataView extends GetView<PassportDataController> {
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
      appBar: AppBar(
        title: Text('Фото паспортных данных', style: basic14),
      ),
      backgroundColor: UiColors.background,
      body: Obx(
        () => Column(
          children: <Widget>[
            ProgressWidget(prosent: 45),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: ListOfRequiredDocuments(
                  data: [
                    RequiredDocData(
                      title: 'Разворот с фотографией',
                      subtitle: '2 и 3 страница',
                      image: getImage(DocumentTypeEnum.passportPhotoFirstPage),
                      onTap: () async {
                        final file = await takePhoto(
                          context: context,
                          title: 'Разворот с фотографией',
                          withHint: true,
                          hint:
                              'Сделайте фото разворота с вашей фотографией. Удостоверьтесь что информацию на вашем снимке можно будет прочесть',
                          imagePath:
                              'assets/images/documents_hints/passport_main.png',
                          withFrame: true,
                        );
                        if (file == null) return;
                        files[DocumentTypeEnum.passportPhotoFirstPage] =
                            file.path;
                      },
                    ),
                    RequiredDocData(
                      title: 'Страница с регистрацией',
                      image:
                          getImage(DocumentTypeEnum.passportPhotoRegistration),
                      imageWidget: isValidFile(
                              DocumentTypeEnum.passportPhotoRegistration)
                          // ? controller.applicationInteractor.otherFiles.isNotEmpty
                          ? Container(
                              width: 62,
                              height: 62,
                              child: getImage(DocumentTypeEnum
                                  .passportPhotoRegistrationNextPage),
                            )
                          // : ImageWithCount(
                          //     image: Image.file(
                          //         controller.passportPhoto2.value
                          //             ?.firstWhere(
                          //                 (element) => element != null),
                          //         fit: BoxFit.cover),
                          //     count: controller.passportPhoto2.value.length,
                          //   )
                          : null,
                      onTap: () async {
                        await takePassportPhoto2(context);
                      },
                    ),
                    RequiredDocData(
                      title: 'Страница семейное положение',
                      subtitle: 'Даже если вы не в браке',
                      image: getImage(DocumentTypeEnum.passportPhotoFamily),
                      onTap: () async {
                        File file = await takePhoto(
                          context: context,
                          title: 'Разворот "Семейное положение"',
                          subtitle: '14-15 страница',
                          withFrame: true,
                        );
                        if (file == null) return;
                        files[DocumentTypeEnum.passportPhotoFamily] = file.path;
                      },
                    ),
                    RequiredDocData(
                      title: 'Селфи с паспортом',
                      subtitle: 'На фоне разворота с фотографией',
                      image: getImage(DocumentTypeEnum.passportSelfie),
                      onTap: () async {
                        final file = await takePhoto(
                          context: context,
                          title: 'Селфи на фоне паспорта',
                          withHint: true,
                          hint:
                              'Сделайте селфи с паспортом. Должна быть открыта страница с вашей фотографией. Убедитесь что видно: ФИО, фото, серию и номер паспорта',
                          imagePath:
                              'assets/images/documents_hints/photo_with_passport.png',
                          widePhoto: true,
                        );
                        if (file == null) return;
                        files[DocumentTypeEnum.passportSelfie] = file.path;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: SafeArea(
                child: AppAccentButton(
                  borderRadius: 0,
                  text: 'Продолжить',
                  icon: Icon(Icons.arrow_forward),
                  // onPressed: () {
                  //   Get.to(AutoDataScreen());
                  // },
                  onPressed:
                      controller.isValid ? () => controller.nextPage() : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  takePassportPhoto2(BuildContext context) async {
    File file = await takePhoto(
      context: context,
      title: 'Страница с регистрацией',
      withHint: true,
      hint: 'Сделайте снимки всех страниц, где заполнена прописка.',
      imagePath: 'assets/images/documents_hints/registration.png',
      withFrame: true,
    );
    if (file == null) return;
    if (!isValidFile(DocumentTypeEnum.passportPhotoRegistration)) {
      files[DocumentTypeEnum.passportPhotoRegistration] = file.path;
    } else {
      files[DocumentTypeEnum.passportPhotoRegistrationNextPage] = file.path;
    }
    Get.dialog(
      PopupWidget(
        text: 'У вас есть ещё страницы с заполненной пропиской?',
        funcYesBtn: () {
          Get.back();
          takePassportPhoto2(context);
        },
        funcNoBtn: () {
          Get.back();
        },
      ),
    );
  }
}
