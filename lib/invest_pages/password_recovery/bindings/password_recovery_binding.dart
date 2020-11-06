import 'package:bibimoney/invest_pages/password_recovery/controllers/password_recovery_controller.dart';
import 'package:get/get.dart';

class PasswordRecoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordRecoveryController>(
      () => PasswordRecoveryController(),
    );
  }
}
