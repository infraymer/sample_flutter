import 'dart:io';

import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/list_of_required_documents.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/required_doc_widget.dart';
import 'package:bibimoney/app/view/ui/widget/skip_button.dart';
import 'package:bibimoney/app/view/ui/widget/take_photo.dart';
import 'package:bibimoney/app/view/ui/widget/take_video.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibimoney/pages/new_loan/photo_and_video_auto/photo_and_video_auto_controller.dart';

class PhotoAndVideoAutoView extends GetView<PhotoAndVideoAutoController> {
  Map<DocumentTypeEnum, String> get files =>
      controller.applicationInteractor.files;

  bool Function(DocumentTypeEnum) get isValidFile =>
      controller.applicationInteractor.isValidFile;

  Image Function(DocumentTypeEnum) get getImage =>
      controller.applicationInteractor.getImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Фото и видео авто', style: basic14)),
      body: Obx(
        () => Column(
          children: [
            ProgressWidget(prosent: 90),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: AppTitleTextField(
                        title: 'Марка, модель, год автомобиля',
                        hintText: controller.carInfo.value ?? '',
                        onChanged: (value) {
                          controller.carInfo.value = value;
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListOfRequiredDocuments(
                      data: [
                        RequiredDocData(
                          title: '360° видео автомобиля',
                          subtitle: 'Запишите на видео машину со всех сторон',
                          imageWidget:
                              isValidFile(DocumentTypeEnum.autoVideo360)
                                  ? Icon(UiIcons.check)
                                  : null,
                          onTap: () async {
                            final file = await takeVideo(
                              context: context,
                              title: '360° видео автомобиля',
                              withHint: true,
                              hint:
                                  'Пожалуйста запишите на видео ваш автомобиль со свех сторон. В видео должно быть видно: гос. номер автомобиля, повреждения (если есть)',
                              imagePath: 'assets/images/video_360.png',
                            );
                            if (file == null) return;
                            files[DocumentTypeEnum.autoVideo360] = file.path;
                          },
                        ),
                        RequiredDocData(
                          title: 'VIN номер автомобиля',
                          image: getImage(DocumentTypeEnum.autoPhotoVin),
                          onTap: () async {
                            final file = await takePhoto(
                              context: context,
                              title: 'VIN номер',
                              withHint: true,
                              hint:
                                  'Сделайте фото VIN-номера. Если его нет — снимите подтверждение его отсутствия',
                              imagePath:
                                  'assets/images/documents_hints/vin.png',
                              widePhoto: true,
                            );
                            if (file == null) return;
                            // onPhoto?.call(file);
                            files[DocumentTypeEnum.autoPhotoVin] = file.path;
                          },
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SkipButton(
              title: 'Заполнить эту информацию позже',
              onPressed: () {
                controller.skip();
              },
            ),
            Container(
              width: double.infinity,
              child: SafeArea(
                child: AppAccentButton(
                  borderRadius: 0,
                  text: 'Проверить заполненную информацию',
                  icon: Icon(Icons.arrow_forward),
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
