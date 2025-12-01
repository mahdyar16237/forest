import 'package:get/get.dart';
import 'package:forest/app/routes/app_routes.dart';
import 'package:forest/app/modules/detaile/splash/Splash_biding/binding_splash.dart';
import 'package:forest/app/modules/detaile/splash/view_Splash/view_splash.dart';
import 'package:forest/app/modules/main/main_bindings/main_binding.dart';
import 'package:forest/app/modules/main/main_views/main_view.dart';
import 'package:forest/app/modules/detaile/Timer/Timer_view/Timer_view.dart';
import 'package:forest/app/modules/detaile/Timer/Timer_biding/Timer_binding.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_view/Statistics_view.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_view/Settings_view.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_binding/Settings.binding.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const ViewSplash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.TIMER,
      page: () => const TimerView(),
      binding: TimerBinding(),
    ),
    GetPage(
      name: Routes.STATISTICS,
      page: () => const StatisticsView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
