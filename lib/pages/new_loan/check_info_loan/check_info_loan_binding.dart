import 'package:get/get.dart';

import 'check_info_loan_controller.dart';

class CheckInfoLoanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckInfoLoanController>(
      () => CheckInfoLoanController(),
    );
  }
}
