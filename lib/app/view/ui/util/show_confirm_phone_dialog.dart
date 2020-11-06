import 'package:bibimoney/app/view/ui/res/decorations.dart';
import 'package:bibimoney/app/view/ui/widget/cancel_order_widget.dart';
import 'package:bibimoney/app/view/ui/widget/confirm_phone_widget.dart';
import 'package:bibimoney/app/view/ui/widget/product_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showConfirmPhoneDialog() {
  Get.bottomSheet(ConfirmPhoneWidget(), backgroundColor: Colors.white);
}

void showCancelOrderDialog(BuildContext context) {
  showModalBottomSheet(
    shape: AppDecorations.roundedBottomSheet,
    context: context,
    builder: (_) => CancelOrderWidget(),
  );
}

void showProductDialog(dynamic data) {
  Get.bottomSheet(ProductInfoWidget(data: data), backgroundColor: Colors.white, isScrollControlled: true);

//  showModalBottomSheet(
//    shape: dialogs.roundedBottomSheet,
//    isScrollControlled: true,
//    context: context,
//    builder: (_) => ProductInfoWidget(),
//  );
}