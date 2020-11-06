import 'package:get/get.dart';

import 'package:bibimoney/pages/new_loan/passport_data/passport_data_controller.dart';

class PassportDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassportDataController>(
      () => PassportDataController(),
    );
  }
}
