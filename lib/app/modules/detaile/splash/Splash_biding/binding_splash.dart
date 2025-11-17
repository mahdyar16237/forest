import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/splash/controllers/controller_splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ControllerSplash());
  }
}
