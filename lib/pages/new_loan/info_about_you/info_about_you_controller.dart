import 'package:bibimoney/app/domain/model/application.dart';
import 'package:bibimoney/app/domain/model/user_info.dart';
import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

class InfoAboutYouController extends GetxController {
  final ApplicationInteractor _applicationInteractor = Get.find();

  // Application application;

  final fullName = ''.obs;
  final cityResidence = ''.obs;
  final addressResidence = ''.obs;
  final income = ''.obs;
  final loanPayments = 0.0.obs;
  final employerName = ''.obs;
  final employesINN = ''.obs;
  final workAddress = ''.obs;
  final workPhone = ''.obs;

  @override
  void onInit() {
    //getApplicationInfo();
    final user = _applicationInteractor.application.user;
    final credit = _applicationInteractor.application.credit;

    fullName.value = user.fullName ?? '';
    cityResidence.value = user.city ?? '';
    addressResidence.value = user.address ?? '';
    income.value = user.displayName ?? '';
    loanPayments.value = credit.otherPayments ?? 0;
    employerName.value = credit.work.data.name ?? '';
    employesINN.value = credit.work.data.inn ?? '';
    workAddress.value = credit.work.data.address ?? '';
    workPhone.value = credit.work.data.phoneNumber ?? '';

    super.onInit();
  }

  // getApplicationInfo() async {
  //   application = _applicationInteractor.getApplication();
  //   fullName.value = application.userInfo.fullName;
  //   cityResidence.value = application.userInfo.cityResidence;
  //   addressResidence.value = application.userInfo.addressResidence;
  //   income.value = application.userInfo.income;
  //   loanPayments.value = application.userInfo.loanPayments;
  //   employerName.value = application.userInfo.employerName;
  //   employesINN.value = application.userInfo.employesINN;
  //   workAddress.value = application.userInfo.workAddress;
  //   workPhone.value = application.userInfo.workPhone;
  // }

  Future<void> nextPage() async {
    final application = _applicationInteractor.application;

    application.credit..otherPayments = loanPayments.value;

    application.user
      ..fullName = fullName.value
      ..city = cityResidence.value
      ..address = addressResidence.value
      ..displayName = income.value;

    application.credit.work.data
      ..name = employerName.value
      ..inn = employesINN.value
      ..address = workAddress.value
      ..phoneNumber = workPhone.value;

    await _applicationInteractor.save();
    await Get.toNamed(Routes.ADDITIONAL_CONTACTS);

    // final userInfo = UserInfo(
    //   fullName.value,
    //   cityResidence.value,
    //   addressResidence.value,
    //   income.value,
    //   loanPayments.value,
    //   employerName.value == '' ? 'Не указано' : employerName.value,
    //   employesINN.value == '' ? 'Не указано' : employesINN.value,
    //   workAddress.value == '' ? 'Не указано' : workAddress.value,
    //   workPhone.value == '' ? 'Не указано' : workPhone.value,
    // );
    //_applicationInteractor.setUserInfo(userInfo);
  }

  bool get isValid =>
      fullName.value != '' &&
      cityResidence.value != '' &&
      addressResidence.value != '' &&
      income.value != '';
  //loanPayments.value != '';
}
