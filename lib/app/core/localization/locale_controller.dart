import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  // زبان پیش‌فرض فارسی
  var locale = const Locale('fa', 'IR').obs;

  @override
  void onInit() {
    super.onInit();
    // you can use SharedPreferences or storage to save the language
    // for now, the default language is persian
    Get.updateLocale(const Locale('fa', 'IR'));
  }

  // change language to persian
  void changeToPersian() {
    locale.value = const Locale('fa', 'IR');
    Get.updateLocale(const Locale('fa', 'IR'));
  }

  // change language to english
  void changeToEnglish() {
    locale.value = const Locale('en', 'US');
    Get.updateLocale(const Locale('en', 'US'));
  }

  // change language (toggle)
  void toggleLanguage() {
    if (locale.value.languageCode == 'fa') {
      changeToEnglish();
    } else {
      changeToPersian();
    }
  }
}
