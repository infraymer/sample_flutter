import 'package:get/get.dart';

import 'package:bibimoney/pages/new_loan/reciving_money/reciving_money_controller.dart';

class RecivingMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecivingMoneyController>(
      () => RecivingMoneyController(),
    );
  }
}
