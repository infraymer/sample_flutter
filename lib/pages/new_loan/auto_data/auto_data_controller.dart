import 'dart:io';

import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

class AutoDataController extends GetxController {
  final ApplicationInteractor applicationInteractor = Get.find();

  // final Rx<File> sts1Photo = Rx<File>();
  // final Rx<File> sts2Photo = Rx<File>();
  // final Rx<File> pts1Photo = Rx<File>();
  // final Rx<File> pts2Photo = Rx<File>();

  // getApplicationInfo() async {
  //   final application = _applicationInteractor.getApplication();
  //   if (application.sts1Path != null)
  //     sts1Photo.value = File(application.sts1Path);
  //   if (application.sts2Path != null)
  //     sts2Photo.value = File(application.sts2Path);
  //   if (application.pts1Path != null)
  //     pts1Photo.value = File(application.pts1Path);
  //   if (application.pts2Path != null)
  //     pts2Photo.value = File(application.pts2Path);
  // }

  bool Function(DocumentTypeEnum) get isValidFile =>
      applicationInteractor.isValidFile;

  bool get isValid => applicationInteractor.isValidAutoDocuments;

  void nextPage() {
    // _applicationInteractor.setSTSAndPTS(
    //     sts1Photo.value, sts2Photo.value, pts1Photo.value, pts2Photo.value);
    Get.toNamed(Routes.RECIVING_MONEY);
  }
}
