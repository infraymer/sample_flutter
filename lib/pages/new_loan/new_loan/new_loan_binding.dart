import 'package:get/get.dart';

import 'package:bibimoney/pages/new_loan/new_loan/new_loan_controller.dart';

class NewLoanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewLoanController>(
      () => NewLoanController(),
    );
  }
}
