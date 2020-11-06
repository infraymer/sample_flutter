import 'package:get/get.dart';

import 'package:bibimoney/pages/new_loan/additional_contacts/additional_contacts_controller.dart';

class AdditionalContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdditionalContactsController>(
      () => AdditionalContactsController(),
    );
  }
}
