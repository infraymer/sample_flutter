import 'package:get/get.dart';

import 'info_about_you_controller.dart';

class InfoAboutYouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoAboutYouController>(
      () => InfoAboutYouController(),
    );
  }
}
