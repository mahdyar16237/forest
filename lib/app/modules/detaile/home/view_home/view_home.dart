import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/localization/locale_controller.dart';
import 'package:forest/app/modules/detaile/home/widget_home/language_dialog.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/detaile/home/widget_home/todays_tree.dart';
import 'package:forest/app/modules/detaile/home/widget_home/container_image.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();

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
                  const SizedBox(height: 80),
                  Text(
                    'forest'.tr,
                    style: TextStyle(
                      fontSize: 33,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  containerImage(),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'plant'.tr,
                        style: TextStyle(color: AppColors.textColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  todayTreeCard(context),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  icon: const Icon(Icons.language, color: Colors.white),
                  onPressed: () =>
                      showLanguageDialog(context, localeController),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
