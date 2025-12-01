import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/home/controllers_home/controller_home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ControllerHome>()) {
      Get.put<ControllerHome>(ControllerHome(), permanent: true);
    }
  }
}
