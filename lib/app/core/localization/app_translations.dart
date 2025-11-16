import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // Common
      'app_name': 'Forest',

      // Splash Screen
      'splash_loading': 'Loading...',

      // Home Screen
      'home_title': 'Home',
      'welcome': 'Welcome',

      // Language
      'language': 'Language',
      'select_language': 'Select your preferred language',
      'english': 'English',
      'persian': 'Persian',
    },
    'fa_IR': {
      // Common
      'app_name': 'جنگل',

      // Splash Screen
      'splash_loading': 'در حال بارگذاری...',

      // Home Screen
      'home_title': 'خانه',
      'welcome': 'خوش آمدید',

      // Language
      'language': 'زبان',
      'select_language': 'زبان مورد نظر خود را انتخاب کنید',
      'english': 'انگلیسی',
      'persian': 'فارسی',
    },
  };
}
