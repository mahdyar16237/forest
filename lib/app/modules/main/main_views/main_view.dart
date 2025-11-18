import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/detaile/home/view_home/view_home.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_view/Statistics_view.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_view/Settings_view.dart';
import 'package:forest/app/modules/main/main_controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  static final List<Widget> _pages = [
    const ViewHome(),
    const StatisticsView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundHome,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeTab,
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF1F4D1F),
              unselectedItemColor: const Color(0xFF2E402E),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_rounded),
                  label: 'home'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.bar_chart_rounded),
                  label: 'statistics'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings_rounded),
                  label: 'Settings'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
