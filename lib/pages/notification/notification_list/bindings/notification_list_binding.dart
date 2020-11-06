import 'package:get/get.dart';

import 'package:bibimoney/pages/notification/notification_list/controllers/notification_list_controller.dart';

class NotificationListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationListController>(
      () => NotificationListController(),
    );
  }
}
