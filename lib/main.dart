import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:forest/app/routes/app_pages.dart';
import 'package:forest/app/core/localization/locale_controller.dart';
import 'package:forest/app/core/localization/app_translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  //  Locale Controller for change language.
  final localeController = Get.put(LocaleController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forest',
      theme: ThemeData(fontFamily: 'PeydaFaNum'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // settings language
      translations: AppTranslations(),
      locale: localeController.locale.value,
      fallbackLocale: const Locale(
        'en',
        'US',
      ), // default language if not found translation
    ),
  );
}
