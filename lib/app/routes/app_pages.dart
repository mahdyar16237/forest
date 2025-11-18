import 'package:get/get.dart';
import 'package:forest/app/routes/app_routes.dart';
import 'package:forest/app/modules/detaile/splash/Splash_biding/binding_splash.dart';
import 'package:forest/app/modules/detaile/splash/view_Splash/view_splash.dart';
import 'package:forest/app/modules/main/main_bindings/main_binding.dart';
import 'package:forest/app/modules/main/main_views/main_view.dart';

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
  ];
}
