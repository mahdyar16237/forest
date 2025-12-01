import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/detaile/home/controllers_home/controller_home.dart';

Widget todayTreeCard(
  BuildContext context, {
  required ControllerHome controller,
}) {
  return Obx(
    () => Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.homeTreeLight.withOpacity(0.9),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.homeTreeMedium,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.eco, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'todays_tree'.tr,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.homeTreeDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: controller.progress,
              minHeight: 10,
              backgroundColor: Colors.white.withOpacity(0.4),
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(controller.progressColor),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: Text(
              controller.timeDisplay,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.homeTreeDark,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (controller.isActive) ...[
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: Text(
                controller.statusText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.homeTreeDark.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
