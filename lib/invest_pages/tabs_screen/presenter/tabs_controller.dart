import 'package:get/get.dart';

class TabsController extends GetxController {
  static TabsController get to => Get.find();

  final tabIndex = 0.obs;

  goToOffice() {
    tabIndex.value = 0;
  }

  goToAbout() {
    tabIndex.value = 1;
  }
}
