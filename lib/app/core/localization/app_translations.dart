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
      'forest': 'Forest',
      'statistics': 'Statistics',
      'Settings': 'Settings',
      'plant': 'Plant',
      'todays Tree': "Today's Tree",
      'home': 'Home',

      // Language
      'language': 'Language',
      'select_language': 'Select your preferred language',
      'english': 'English',
      'persian': 'Persian',
    },
    'fa_IR': {
      // Splash Screen
      'splash_loading': 'در حال بارگذاری...',
      'app_name': 'جنگل',

      // Home Screen
      'forest': 'جنگل',
      'statistics': 'آمار',
      'Settings': 'تنظیمات',
      'plant': 'کاشتن',
      'todays Tree': 'درخت امروز',
      'home': 'خانه',
      // Language
      'language': 'زبان',
      'select_language': 'زبان مورد نظر خود را انتخاب کنید',
      'english': 'انگلیسی',
      'persian': 'فارسی',
    },
  };
}
