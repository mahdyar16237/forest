import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/routes/app_pages.dart';
import 'package:forest/app/core/localization/app_translations.dart';
import 'package:forest/app/core/localization/locale_controller.dart';

void main() {
  // Initialize Locale Controller
  Get.put(LocaleController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forest',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // تنظیمات چندزبانه
      translations: AppTranslations(),
      locale: const Locale('fa', 'IR'), // default language
      fallbackLocale: const Locale(
        'en',
        'US',
      ), // default language if not found translation
    ),
  );
}
