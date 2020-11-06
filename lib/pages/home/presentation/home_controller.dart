import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final tabIndex = 0.obs;

  goToCatalog() {
    tabIndex.value = 0;
  }

  goToProfile() {
    tabIndex.value = 1;
  }
}