import 'package:get/get.dart';

import 'package:bibimoney/pages/new_loan/auto_data/auto_data_controller.dart';

class AutoDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutoDataController>(
      () => AutoDataController(),
    );
  }
}
