import 'dart:io';

import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

class PassportDataController extends GetxController {
  final ApplicationInteractor applicationInteractor = Get.find();

  // final Rx<File> passportPhoto1 = Rx<File>();
  // final Rx<List<File>> passportPhoto2 = Rx<List<File>>();
  // final Rx<File> passportPhoto3 = Rx<File>();
  // final Rx<File> passportPhoto4 = Rx<File>();

  // getApplicationInfo() async {
  //   final application = _applicationInteractor.getApplication();
  //   if (application.passportPhoto1Path != null)
  //     passportPhoto1.value = File(application.passportPhoto1Path);
  //   if (application.passportPhoto2Path != null)
  //     passportPhoto2.value =
  //         application.passportPhoto2Path.map((e) => File(e)).toList();
  //   if (application.passportPhoto3Path != null)
  //     passportPhoto3.value = File(application.passportPhoto3Path);

  //   if (application.passportPhoto4Path != null)
  //     passportPhoto4.value = File(application.passportPhoto4Path);
  // }

  // addFilePassport2(File file) {
  //   if (passportPhoto2.value == null) {
  //     passportPhoto2.value = [file];
  //   } else {
  //     passportPhoto2.value.add(file);
  //   }
  // }

  // clearFilePassport2() {
  //   passportPhoto2.value = [];
  // }

  bool get isValid => applicationInteractor.isValidPassportPhotos;

  void nextPage() {
    // _applicationInteractor.setPassportPhoto(passportPhoto1.value,
    //     passportPhoto2.value, passportPhoto3.value, passportPhoto4.value);
    Get.toNamed(Routes.AUTO_DATA);
  }
}
