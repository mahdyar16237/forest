import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_binding/Statistics_biding.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_binding/Settings.binding.dart';
import 'package:forest/app/modules/main/main_controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<MainController>()) {
      Get.put<MainController>(MainController(), permanent: true);
    }
    StatisticsBinding().dependencies();
    SettingsBinding().dependencies();
  }
}
