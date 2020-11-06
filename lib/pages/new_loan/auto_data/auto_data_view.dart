import 'dart:io';

import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/list_of_required_documents.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/required_doc_widget.dart';
import 'package:bibimoney/app/view/ui/widget/take_photo.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auto_data/auto_data_controller.dart';

class AutoDataView extends GetView<AutoDataController> {
  Map<DocumentTypeEnum, String> get files =>
      controller.applicationInteractor.files;

  Image Function(DocumentTypeEnum) get getImage =>
      controller.applicationInteractor.getImage;

  @override
  Widget build(BuildContext context) {
    // controller.getApplicationInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Фото ПТС и СТС', style: basic14),
      ),
      backgroundColor: UiColors.background,
      body: Obx(
        () => Column(
          children: <Widget>[
            ProgressWidget(prosent: 60),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: ListOfRequiredDocuments(
                  data: [
                    RequiredDocData(
                      title: 'Лицевой разворот ПТС',
                      image: getImage(DocumentTypeEnum.autoPhotoPts),
                      onTap: () async {
                        final file = await takePhoto(
                          context: context,
                          title: 'Лицевой разворот ПТС',
                          withHint: true,
                          hint:
                              'Сделайте фото лицевого разворота ПТС, как показано выше',
                          imagePath:
                              'assets/images/documents_hints/outside_pts.png',
                          withFrame: true,
                        );
                        if (file == null) return;
                        files[DocumentTypeEnum.autoPhotoPts] = file.path;
                      },
                    ),
                    RequiredDocData(
                      title: 'Внутренний разворот ПТС',
                      image: getImage(DocumentTypeEnum.autoPhotoPtsBack),
                      onTap: () async {
                        final file = await takePhoto(
                          context: context,
                          title: 'Внутренний разворот ПТС',
                          withHint: true,
                          hint:
                              'Сделайте фото внутреннего разворота ПТС, как показано выше',
                          imagePath:
                              'assets/images/documents_hints/inside_pts.png',
                          withFrame: true,
                        );
                        if (file == null) return;
                        files[DocumentTypeEnum.autoPhotoPtsBack] = file.path;
                      },
                    ),
                    RequiredDocData(
                      title: 'Лицевая сторона СТС',
                      image: getImage(DocumentTypeEnum.autoPhotoSts),
                      onTap: () async {
                        final file = await takePhoto(
                          context: context,
                          title: 'Лицевая сторона СТС',
                          withHint: true,
                          hint:
                              'Сделайте фото лицевой стороны СТС, как показано выше',
                          imagePath:
                              'assets/images/documents_hints/outside_sts.png',
                          withFrame: true,
                        );
                        if (file == null) return;
                        files[DocumentTypeEnum.autoPhotoSts] = file.path;
                      },
                    ),
                    RequiredDocData(
                      title: 'Обратная сторона СТС',
                      image: getImage(DocumentTypeEnum.autoPhotoStsBack),
                      onTap: () async {
                        final file = await takePhoto(
                          context: context,
                          title: 'Обратная сторона СТС',
                          withHint: true,
                          hint:
                              'Сделайте фото обратной стороны СТС, как показано выше',
                          imagePath:
                              'assets/images/documents_hints/inside_sts.png',
                          withFrame: true,
                        );
                        if (file == null) return;
                        files[DocumentTypeEnum.autoPhotoStsBack] = file.path;
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
                  //   Get.to(RecivingMoneyScreen());
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
}
