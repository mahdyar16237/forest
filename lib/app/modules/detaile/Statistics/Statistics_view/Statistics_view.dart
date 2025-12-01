import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_controller/Statistics_controller.dart';
import '../widget/Statistics_widget.dart';
import '../widget/stats_text.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 229, 188),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  statsHeading('statistics'.tr),
                  const SizedBox(height: 30),
                  // Today's Focus
                  statsSection('today_focus'.tr),
                  const SizedBox(height: 12),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        statsValueLarge('${controller.todayMinutes.value}'),
                        const SizedBox(width: 5),
                        statsLabel('minutes'.tr),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Week Summary
                  statsSection('Week'.tr),
                  const SizedBox(height: 12),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        statsValueMedium('${controller.weeklyHours.value}'),
                        const SizedBox(width: 3),
                        statsValueMedium('h'.tr),
                        const SizedBox(width: 10),
                        statsValueMedium('${controller.weeklyMinutes.value}'),
                        const SizedBox(width: 3),
                        statsValueMedium('m'.tr),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  statisticsChart(controller: controller),
                  const SizedBox(height: 89),
                  statsSection('All - time'.tr),
                  const SizedBox(height: 50),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tree.png',
                          width: 50,
                          height: 50,
                        ),
                        statsValueMedium('${controller.allTimeMinutes.value}'),
                        const SizedBox(width: 3),
                        statsValueMedium('minutes'.tr),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
