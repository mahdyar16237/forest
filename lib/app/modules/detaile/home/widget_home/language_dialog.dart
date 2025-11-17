import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/localization/locale_controller.dart';

void showLanguageDialog(
  BuildContext context,
  LocaleController localeController,
) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade50, Colors.green.shade100],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with plant icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.eco, size: 40, color: Colors.green.shade700),
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              'language'.tr,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'select_language'.tr,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            // English option
            _buildLanguageOption(
              icon: Icons.flag,
              title: 'English',
              subtitle: 'English',
              locale: const Locale('en', 'US'),
              isSelected: localeController.locale.value.languageCode == 'en',
              onTap: () {
                localeController.changeToEnglish();
                Get.back();
              },
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            // Persian option
            _buildLanguageOption(
              icon: Icons.flag,
              title: 'فارسی',
              subtitle: 'Persian',
              locale: const Locale('fa', 'IR'),
              isSelected: localeController.locale.value.languageCode == 'fa',
              onTap: () {
                localeController.changeToPersian();
                Get.back();
              },
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            // Decorative plants
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.park, size: 16, color: Colors.green.shade400),
                const SizedBox(width: 8),
                Icon(Icons.forest, size: 16, color: Colors.green.shade500),
                const SizedBox(width: 8),
                Icon(Icons.nature, size: 16, color: Colors.green.shade400),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildLanguageOption({
  required IconData icon,
  required String title,
  required String subtitle,
  required Locale locale,
  required bool isSelected,
  required VoidCallback onTap,
  required Color color,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? color : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? (color == Colors.blue
                              ? Colors.blue.shade900
                              : Colors.green.shade900)
                        : Colors.grey.shade900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          // Selected indicator
          if (isSelected)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            ),
        ],
      ),
    ),
  );
}
