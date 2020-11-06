import 'package:get/get.dart';

class PasswordSendController extends GetxController {
  final email = ''.obs;

  @override
  void onInit() {
    email.value = Get.arguments as String;
  }
}
