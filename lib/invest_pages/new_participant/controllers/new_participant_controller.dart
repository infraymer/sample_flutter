import 'package:bibimoney/app/base/util/handle_error.dart';
import 'package:bibimoney/app/controllers/api_controller.dart';
import 'package:bibimoney/app/domain/model/user_ivest.dart';
import 'package:bibimoney/app/domain/update_user/update_user_interactor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NewParticipantController extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final UpdateUserInteractor _userInteracotor = Get.find();
  final isSecret = true.obs;

  final phone = ''.obs;
  final email = ''.obs;
  final name = ''.obs;

  final isLoading = false.obs;

  final password = ''.obs;
  final repeatedPassword = ''.obs;

  bool checkConditions() {
    return password.value == repeatedPassword.value &&
        password.value.isNotEmpty &&
        name.value.isNotEmpty &&
        email.value.isEmail;
    // С учетом +

    // phone.value.isPhoneNumber TODO: в Get же куча утилит для тестов строк

    //phone.value.length == 12 && phone.value.startsWith('+7');
  }

  Future<void> registration() async {
    try {
      isLoading.value = true;
      // final User user = (await _auth.createUserWithEmailAndPassword(
      //   email: email.value,
      //   password: password.value,
      // ))
      //     .user;
      // print('registration success');
      // print(user);
      // await _userInteracotor
      //     .updateUser(UserInvestor(fullName: name.value, phone: phone.value));
      await ApiController.to.register(email.value, password.value);
      await ApiController.to.login(email.value, password.value);
      Get.back();
    } catch (error, stack) {
      print(error);
      print(stack);
      Get.snackbar('', handleError(error));
    } finally {
      isLoading.value = false;
    }
  }
}
