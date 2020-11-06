import 'package:bibimoney/invest_pages/root_invest/controllers/root_invest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootInvestView extends GetView<RootInvestController> {
  @override
  Widget build(BuildContext context) {
    controller.onStart();
    return Scaffold(
      body: Container(),
    );
  }
}
