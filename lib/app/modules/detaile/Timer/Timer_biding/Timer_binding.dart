import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/Timer/Timer_controller/Timer_controller.dart';

class TimerBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<TimerController>()) {
      Get.put<TimerController>(TimerController(), permanent: true);
    }
  }
}
