import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_controller/Statistics_controller.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<StatisticsController>()) {
      Get.lazyPut<StatisticsController>(
        () => StatisticsController(),
        fenix: true,
      );
    }
  }
}
