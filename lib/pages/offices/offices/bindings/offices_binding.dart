import 'package:get/get.dart';

import 'package:bibimoney/pages/offices/offices/controllers/offices_controller.dart';

class OfficesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfficesController>(
      () => OfficesController(),
    );
  }
}
