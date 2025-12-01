import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  SettingsController() : _storage = GetStorage();

  final GetStorage _storage;

  static const _displayNameKey = 'settings_display_name';
  static const _emailKey = 'settings_email';
  static const _soundPackKey = 'settings_sound_pack';
  static const _notificationsKey = 'settings_notifications';
  static const _focusMinutesKey = 'settings_focus_minutes';

  final RxString displayName = 'mahdiyar'.obs;
  final RxString email = 'mahdyar16237@gmail.com'.obs;

  final RxString soundPack = 'Forest 1'.obs;
  final RxBool notificationsEnabled = true.obs;

  final RxInt focusMinutes = 25.obs;

  final RxString appVersion = ' 1.0.0'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadPersistedSettings();
  }

  void _loadPersistedSettings() {
    displayName.value =
        _storage.read<String>(_displayNameKey) ?? displayName.value;
    email.value = _storage.read<String>(_emailKey) ?? email.value;
    soundPack.value = _storage.read<String>(_soundPackKey) ?? 'Forest 1';
    notificationsEnabled.value = _storage.read<bool>(_notificationsKey) ?? true;
    focusMinutes.value = _storage.read<int>(_focusMinutesKey) ?? 25;
  }

  void updateSoundPack(String name) {
    soundPack.value = name;
    _storage.write(_soundPackKey, name);
  }

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    _storage.write(_notificationsKey, value);
  }

  void updateFocusDuration(int minutes) {
    focusMinutes.value = minutes;
    _storage.write(_focusMinutesKey, minutes);
  }

  void updateProfile({required String name, required String emailAddress}) {
    displayName.value = name;
    email.value = emailAddress;
    _storage
      ..write(_displayNameKey, name)
      ..write(_emailKey, emailAddress);
  }
}
