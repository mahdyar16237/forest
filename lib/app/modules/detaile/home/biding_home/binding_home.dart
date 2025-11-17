import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/home/controllers/controller_home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControllerHome());
  }
}
