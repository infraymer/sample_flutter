import 'package:bibimoney/invest_pages/root_invest/controllers/root_invest_controller.dart';
import 'package:get/get.dart';


class RootInvestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootInvestController>(
      () => RootInvestController(),
    );
  }
}
