import 'package:get/get.dart';
import 'package:forest/app/routes/app_routes.dart';
import 'package:forest/app/modules/detaile/home/biding/binding_home.dart';
import 'package:forest/app/modules/detaile/home/view/view_home.dart';
import 'package:forest/app/modules/detaile/splash/biding/binding_splash.dart';
import 'package:forest/app/modules/detaile/splash/view/view_splash.dart';

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
      page: () => const ViewHome(),
      binding: HomeBinding(),
    ),
  ];
}
