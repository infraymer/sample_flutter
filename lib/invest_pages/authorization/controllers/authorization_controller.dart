import 'package:bibimoney/app/base/util/handle_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthorizationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final isSecret = true.obs;

  final email = ''.obs;
  final password = ''.obs;

  // bool checkConditions() {
  //   return password.value == repeatedPassword.value &&
  //       password.value.length > 0 &&
  //       name.value.length > 0 &&
  //       email.value.contains('@') &&
  //       email.value.contains('.') &&
  //       // С учетом +
  //       phone.value.length == 12 &&
  //       phone.value.startsWith('+7');
  // }

  sigin() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      ))
          .user;
      print('singin success');
      print(user);
      if (user != null) {
        print('singin!!!!!!!!!!!!');
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      Get.snackbar('', handleError(error));
    }
  }
}
