import 'package:bibimoney/app/controllers/user_controller.dart';
import 'package:bibimoney/pages/auth/auth_screen.dart';
import 'package:bibimoney/pages/home/view/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibimoney/pages/root/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => UserController.isAuth ? HomeScreen() : AuthScreen());
    // return StreamBuilder<bool>(
    //   stream: controller.isAuth,
    //   builder: (context, snapshot) {
    //     return snapshot.data != true ? AuthScreen() : HomeScreen();
    //   },
    // );
  }

  // Widget buildReg() => Obx(() => RootController.to.user.value == null
  //     ? InfoAboutYouScreen()
  //     : MainScreen());
}
