import 'dart:io';

import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

class PhotoAndVideoAutoController extends GetxController {
  final ApplicationInteractor applicationInteractor = Get.find();
  Map<DocumentTypeEnum, String> get files => applicationInteractor.files;

  bool Function(DocumentTypeEnum) get isValidFile =>
      applicationInteractor.isValidFile;

  final carInfo = ''.obs;
  // final Rx<File> carVideo = Rx<File>();
  // final Rx<File> carVIN = Rx<File>();

  // getApplicationInfo() async {
  //   final application = _applicationInteractor.getApplication();
  //   carInfo.value = application.carInfo;
  //   carVideo.value = File(application.carVideoPath);
  //   carVIN.value = File(application.vinNumberCarPath);
  // }

  //   isValidData() {
  //   return carInfo.value != null &&
  //       carVideo.value != null &&
  //       carVIN.value != null;
  // }

  bool get isValid =>
      !GetUtils.isNullOrBlank(carInfo.value) &&
      applicationInteractor.isValidAutoPhotoAndVideo;

  Future<void> nextPage() async {
    applicationInteractor.application.credit.autoInfo = carInfo.value;

    await applicationInteractor.save();
    await Get.toNamed(Routes.CHECK_INFO_LOAN);
  }

  void skip() {
    Get.toNamed(Routes.CHECK_INFO_LOAN);
  }
}
