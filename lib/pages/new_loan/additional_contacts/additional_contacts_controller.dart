import 'package:bibimoney/app/domain/model/application.dart';
import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

class AdditionalContactsController extends GetxController {
  final ApplicationInteractor _applicationInteractor = Get.find();

  // Application application;

  final contactName = ''.obs;
  final byWhom = ''.obs;
  final contactPhone = ''.obs;

  @override
  void onInit() {
    // getApplicationInfo();
    final contact = _applicationInteractor.application.credit.contact.data;
    contactName.value = contact.name;
    byWhom.value = contact.whoIs;
    contactPhone.value = contact.phoneNumber;

    super.onInit();
  }

  // getApplicationInfo() async {
  //   application = _applicationInteractor.getApplication();
  //   contactName.value = application.contactName;
  //   contactPhone.value = application.contactPhone;
  //   byWhom.value = application.byWhom;
  // }

  bool get isValid =>
      contactPhone.value.isPhoneNumber &&
      !GetUtils.isNullOrBlank(contactName.value) &&
      !GetUtils.isNullOrBlank(byWhom.value);

  Future<void> nextPage() async {
    // _applicationInteractor.setAdditionalContacts(
    //     contactName.value, contactPhone.value, byWhom.value);

    _applicationInteractor.application.credit.contact.data
      ..name = contactName.value
      ..phoneNumber = contactPhone.value
      ..whoIs = byWhom.value;

    await _applicationInteractor.save();
    await Get.toNamed(Routes.PASSPORT_DATA);
  }
}
