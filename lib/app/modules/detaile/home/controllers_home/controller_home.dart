import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/Timer/Timer_controller/Timer_controller.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_controller/Settings_controller.dart';

class ControllerHome extends GetxController {
  TimerController get timerController => Get.find<TimerController>();
  SettingsController get settingsController => Get.find<SettingsController>();

  double get progress => timerController.progress.clamp(0.0, 1.0);

  bool get isActive =>
      timerController.isRunning.value || timerController.isPaused.value;

  String get timeDisplay {
    if (isActive && timerController.remainingSeconds.value > 0) {
      final minutes = timerController.remainingSeconds.value ~/ 60;
      final seconds = timerController.remainingSeconds.value % 60;
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      final totalMinutes = settingsController.focusMinutes.value;
      return '${totalMinutes.toString().padLeft(2, '0')}:00';
    }
  }

  String get statusText {
    if (!isActive) return '';
    // Use Get.locale to ensure translation works correctly
    final isRunning = timerController.isRunning.value;
    return isRunning ? 'running'.tr : 'paused'.tr;
  }

  int get progressColor {
    return isActive ? 0xFF1F4D1F : 0xFF6A9F6C;
  }
}
