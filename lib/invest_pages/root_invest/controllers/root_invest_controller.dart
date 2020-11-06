import 'package:bibimoney/app/interactor/application/user_interactor.dart';
import 'package:bibimoney/invest_pages/tabs_screen/tabs_screen.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:get/get.dart';

class RootInvestController extends GetxController {
  // final UserInteractor _userInteractor = Get.find();

  @override
  void onInit() {
    // _userInteractor.isAuth().listen((event) {
    //   if (event) {
    //     Get.offAll(TabsScreen());
    //   } else {
    //     Get.offAllNamed(Routes.AUTHORIZATION);
    //   }
    // });
  }
}
