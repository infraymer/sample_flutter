import 'package:bibimoney/app/base/util/handle_error.dart';
import 'package:bibimoney/app/controllers/controllers.dart';
import 'package:bibimoney/app/domain/model/application.dart';
import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:bibimoney/pages/new_loan/end/end_loan_screen.dart';
import 'package:get/get.dart';

class CheckInfoLoanController extends GetxController {
  final ApplicationInteractor applicationInteractor = Get.find();

  // final Rx<Application> application = Rx<Application>();
  final isLoading = false.obs;

  bool get isValid => applicationInteractor.isValid;

  // }

  // isValidData() {
  //   return application.value.byWhom != null &&
  //       application.value.carVideoPath != null &&
  //       application.value.cardNumber != null &&
  //       application.value.vinNumberCarPath != null &&
  //       application.value.passportPhoto1Path != null &&
  //       application.value.passportPhoto2Path != null &&
  //       application.value.passportPhoto3Path != null &&
  //       application.value.passportPhoto4Path != null &&
  //       application.value.sts1Path != null &&
  //       application.value.sts2Path != null &&
  //       application.value.pts1Path != null &&
  //       application.value.pts2Path != null &&
  //       application.value.sumLoan != null &&
  //       application.value.periodLoan != null &&
  //       application.value.userInfo != null &&
  //       application.value.userInfo != null &&
  //       application.value.userInfo != null &&
  //       application.value.userInfo != null &&
  //       // application.value.cardNumber != null &&
  //       application.value.carInfo != null;
  // }

  // getApplicationInfo() async {
  //   application.value = _applicationInteractor.getApplication();
  // }

  Future<void> createApplication() async {
    try {
      isLoading.value = true;
      // await _applicationInteractor.createApplication(application.value);
      await applicationInteractor.sendRequest();
      await Get.off(EndLoanScreen());
    } catch (error) {
      Get.snackbar('', handleError(error));
    } finally {
      isLoading.value = false;
    }
  }
}
