import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/main/main_controllers/main_controller.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.showBottomNav = true,
    this.onNavigationTap,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool showBottomNav;
  final ValueChanged<int>? onNavigationTap;

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.isRegistered<MainController>()
        ? Get.find<MainController>()
        : Get.put(MainController());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      bottomNavigationBar: showBottomNav
          ? Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    onTap: (index) {
                      if (onNavigationTap != null) {
                        onNavigationTap!(index);
                      } else {
                        controller.changeTab(index);
                      }
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: AppColors.navSelected,
                    unselectedItemColor: AppColors.navUnselected,
                    selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
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
                        label: 'settings'.tr,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
