import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

// import 'info_about_you/info_about_you_screen.dart';

class NewLoanController extends GetxController {
  final ApplicationInteractor _applicationInteractor = Get.find();

  // final monthlyPayment = 0.0.obs;
  final loanAmount = 0.0.obs;
  final loanTerm = 1.0.obs;

  double get monthlyPayment =>
      loanAmount.value / (loanTerm.value > 0 ? loanTerm.value : 1);

  @override
  void onInit() {
    final credit = _applicationInteractor.application.credit;
    loanAmount.value = credit.requestSum ?? 0;
    loanTerm.value = credit.requestTerm?.toDouble() ?? 1;

    super.onInit();
  }

  // getApplicationInfo() async {
  //   final application = _applicationInteractor.getApplication();
  //   loanAmount.value = application?.sumLoan ?? 0.0;
  //   loanTerm.value = application?.periodLoan ?? 1.0;
  //   _calculationOfMonthlyPayment();
  // }

  // void changeLoanAmount(double amount) {
  //   loanAmount.value = amount;
  //   _calculationOfMonthlyPayment();
  // }

  // void changeLoanTerm(double term) {
  //   loanTerm.value = term;
  //   _calculationOfMonthlyPayment();
  // }

  // void _calculationOfMonthlyPayment() {
  //   if (loanTerm.value > 0)
  //     monthlyPayment.value = loanAmount.value / loanTerm.value;
  // }

  bool get isValid => loanAmount.value > 0 && loanTerm.value > 0;

  Future<void> nextPage() async {
    // _applicationInteractor.setSumAndPeriod(loanAmount.value, loanTerm.value);
    // Get.to(InfoAboutYou());

    _applicationInteractor.application.credit
      ..requestSum = loanAmount.value
      ..requestTerm = loanTerm.value.toInt();

    await _applicationInteractor.save();
    await Get.toNamed(Routes.INFO_ABOUT_YOU);
  }
}
