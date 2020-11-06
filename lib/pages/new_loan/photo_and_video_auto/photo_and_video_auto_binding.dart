import 'package:get/get.dart';

import 'package:bibimoney/pages/new_loan/photo_and_video_auto/photo_and_video_auto_controller.dart';

class PhotoAndVideoAutoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoAndVideoAutoController>(
      () => PhotoAndVideoAutoController(),
    );
  }
}
