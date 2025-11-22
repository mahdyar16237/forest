import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxString displayName = 'mahdiyar'.obs;
  final RxString email = 'mahdyar16237@gmail.com'.obs;

  final RxString soundPack = 'Forest 1'.obs;
  final RxBool notificationsEnabled = true.obs;

  final RxInt focusMinutes = 25.obs;
  final RxInt shortBreakMinutes = 5.obs;
  final RxInt longBreakMinutes = 15.obs;

  final RxString appVersion = ' 1.0.0'.obs;

  void updateSoundPack(String name) {
    soundPack.value = name;
  }

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }

  void updateFocusDuration(int minutes) {
    focusMinutes.value = minutes;
  }

  void updateShortBreak(int minutes) {
    shortBreakMinutes.value = minutes;
  }

  void updateLongBreak(int minutes) {
    longBreakMinutes.value = minutes;
  }
}
