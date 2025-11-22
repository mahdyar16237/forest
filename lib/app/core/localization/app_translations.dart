import 'package:get/get.dart';
import 'package:forest/app/core/localization/app_translation_en.dart';
import 'package:forest/app/core/localization/app_translation_fa.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'fa_IR': faIR};
}
