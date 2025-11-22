import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  static const _storageKey = 'locale';
  final _storage = GetStorage();

  // persian language default
  var locale = const Locale('fa', 'IR').obs;

  @override
  void onInit() {
    super.onInit();
    final saved = _storage.read<String>(_storageKey);
    if (saved != null) {
      locale.value = _stringToLocale(saved);
    }
    Get.updateLocale(locale.value);
  }

  void changeToPersian() => _setLocale(const Locale('fa', 'IR'));

  void changeToEnglish() => _setLocale(const Locale('en', 'US'));

  void toggleLanguage() {
    if (locale.value.languageCode == 'fa') {
      changeToEnglish();
    } else {
      changeToPersian();
    }
  }

  void _setLocale(Locale newLocale) {
    locale.value = newLocale;
    _storage.write(_storageKey, _localeToString(newLocale));
    Get.updateLocale(newLocale);
  }

  Locale _stringToLocale(String value) {
    final parts = value.split('_');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(parts[0]);
  }

  String _localeToString(Locale value) {
    return value.countryCode != null && value.countryCode!.isNotEmpty
        ? '${value.languageCode}_${value.countryCode}'
        : value.languageCode;
  }
}
