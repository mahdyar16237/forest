import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/detaile/home/widget_home/todays_tree.dart';
import 'package:forest/app/modules/detaile/home/widget_home/container_image.dart';
import 'package:forest/app/modules/detaile/home/controllers_home/controller_home.dart';
import 'package:forest/app/routes/app_routes.dart';

class ViewHome extends GetView<ControllerHome> {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.isRegistered<ControllerHome>()
        ? Get.find<ControllerHome>()
        : Get.put<ControllerHome>(ControllerHome(), permanent: true);
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'forest'.tr,
                    style: TextStyle(
                      fontSize: 33,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  containerImage(),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black.withOpacity(0.2),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.TIMER);
                      },
                      child: Text(
                        'plant'.tr,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  todayTreeCard(context, controller: homeController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
