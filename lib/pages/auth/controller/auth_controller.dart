import 'package:bibimoney/app/base/resources/strings.dart';
import 'package:bibimoney/app/base/util/handle_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../conformation_phone_screen.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final isLoading = false.obs;
  final isCode = false.obs;

  final phone = ''.obs;
  final code = ''.obs;
  final isAuthorized = false.obs;

  String _actualCode;

  Future<void> sendCode() async {
    isLoading.value = true;
    firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: phone.value,
      timeout: const Duration(seconds: 60),
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    )
        .catchError((error) {
      print("Error sendCode: $error");
    });
  }

  Future<void> accept() async {
    try {
      isLoading.value = true;
      phone.value = '';
      Get.back();
    } catch (e) {
      Get.snackbar('', handleError(e));
    } finally {
      isLoading.value = false;
    }
  }

  void signInWithPhoneNumber() {
    isLoading.value = true;
    bool isError = false;
    try {
      var _authCredential = PhoneAuthProvider.credential(
          verificationId: _actualCode, smsCode: code.value);

      firebaseAuth.signInWithCredential(_authCredential).catchError((error) {
        isError = true;
        Get.rawSnackbar(message: AppStrings.authError);
      }).then((user) async {
        if (!isError) {
//          final userFB = await getCreatedUser();
//          this.user = userFB;
//          isAuthorized.value = true;
          Get.back();
        }
      }).whenComplete(() {
        isLoading.value = false;
        // isAuthorized.value = false;
      });
    } catch (error) {
      print(error);
    }
  }

  void _verificationCompleted(AuthCredential auth) {
    isLoading.value = false;
    firebaseAuth.signInWithCredential(auth).then((value) {
      if (value.user != null) {
        Get.back(result: true);
      } else {
        Get.rawSnackbar(message: AppStrings.codeError);
      }
    }).catchError((error) {
      Get.rawSnackbar(message: AppStrings.someError);
    });
  }

  void _verificationFailed(FirebaseAuthException authException) {
    isLoading.value = false;
    String status;
    if (authException.message.contains('not authorized'))
      status = AppStrings.someError;
    else if (authException.message.contains('Network'))
      status = AppStrings.networkError;
    else
      status = AppStrings.someError;
    Get.rawSnackbar(message: status);
  }

  void _codeSent(String verificationId, [int forceResendingToken]) async {
    this._actualCode = verificationId;
    this.isCode.value = true;
    isLoading.value = false;
    Get.to(ConformationPhoneScreen());
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    this._actualCode = verificationId;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    // Get.offAll(RootScreen());
  }
}
