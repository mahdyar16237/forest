import 'package:get/get.dart';
import 'package:forest/app/routes/app_routes.dart';

class ControllerSplash extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // wait 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // navigate to home
    Get.offNamed(Routes.HOME);
  }
}
