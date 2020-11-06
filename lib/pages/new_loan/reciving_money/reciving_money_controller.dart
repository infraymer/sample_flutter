import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

class RecivingMoneyController extends GetxController {
  final ApplicationInteractor applicationInteractor = Get.find();

  final cardNumber = ''.obs;

  @override
  void onInit() {
    cardNumber.value = applicationInteractor.application.credit.cardNumber;
    super.onInit();
  }

  Future<void> nextPage() async {
    applicationInteractor.application.credit.cardNumber = cardNumber.value;

    await applicationInteractor.save();
    await Get.toNamed(Routes.PHOTO_AND_VIDEO_AUTO);
  }

  bool get isValid => !GetUtils.isNullOrBlank(cardNumber.value);
}
