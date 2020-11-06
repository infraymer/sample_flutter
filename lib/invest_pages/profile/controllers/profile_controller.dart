import 'package:bibimoney/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final isSecretPassword = true.obs;
  final isSecretNewPassword = true.obs;
  final _auth = FirebaseAuth.instance;

  final phone = ''.obs;
  final email = ''.obs;
  final name = ''.obs;

  final password = ''.obs;
  final newPassword = ''.obs;

  // Переключатели
  final incomeCash = false.obs;
  final withMessages = false.obs;
  final withOffers = false.obs;

  // TODO: Тут надо будет сверку со старым паролем еще делать
  bool checkPassword() {
    return newPassword.value.length > 0;
  }

  signOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.ROOT_INVEST);
  }
}
