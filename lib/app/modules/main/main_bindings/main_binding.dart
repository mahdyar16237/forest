import 'package:get/get.dart';
import 'package:forest/app/modules/main/main_controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
