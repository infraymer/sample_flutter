import 'package:bibimoney/app/base/util/handle_error.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PasswordRecoveryController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final email = ''.obs;

  resetPassword() {
    assert(email.value != '');
    try {
      _auth.sendPasswordResetEmail(email: email.value);
      Get.toNamed(Routes.PASSWORD_SEND, arguments: email.value);
    } catch (e) {
      Get.snackbar('', handleError(e));
    }
  }
}
