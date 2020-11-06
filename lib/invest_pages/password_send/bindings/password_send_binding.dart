import 'package:get/get.dart';

import 'package:bibimoney/invest_pages/password_send/controllers/password_send_controller.dart';

class PasswordSendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordSendController>(
      () => PasswordSendController(),
    );
  }
}
