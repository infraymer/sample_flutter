import 'package:get/get.dart';

import 'package:bibimoney/pages/new_loan/add_card/add_card_controller.dart';

class AddCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCardController>(
      () => AddCardController(),
    );
  }
}
