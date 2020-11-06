import 'package:bibimoney/invest_pages/new_participant/controllers/new_participant_controller.dart';
import 'package:get/get.dart';

class NewParticipantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewParticipantController>(
      () => NewParticipantController(),
    );
  }
}
