import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/detaile/Timer/widget/container_timer.dart';
import 'package:forest/app/modules/detaile/Timer/widget/actionButton.dart';
import 'package:forest/app/modules/detaile/Timer/Timer_controller/Timer_controller.dart';
import 'package:forest/app/modules/main/main_controllers/main_controller.dart';
import 'package:forest/app/modules/main/widgets/main_scaffold.dart';
import 'package:forest/app/routes/app_routes.dart';

class TimerView extends GetView<TimerController> {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: AppColors.backgroundTimer,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundTimer,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.timerAccent,
          ),
          onPressed: () {
            // save timer state
            if (controller.isRunning.value || controller.isPaused.value) {
              controller.saveTimerState();
            }
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          'focus_timer'.tr,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.timerAccent,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'focus_timer'.tr,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.timerAccent,
                          ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                      child: const SizedBox.shrink(),
                    ),
                    Obx(
                      () => timerCircle(
                        context: context,
                        progress: controller.progress,
                        timeLabel: controller.formattedTime,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.15,
                      child: const SizedBox.shrink(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Obx(
                        () => Column(
                          children: [
                            //start timer
                            if (!controller.isRunning.value &&
                                !controller.isPaused.value &&
                                controller.remainingSeconds.value > 0)
                              Row(
                                children: [
                                  Expanded(
                                    child: timerActionButton(
                                      context: context,
                                      label: 'start'.tr,
                                      color: AppColors.timerPrimary,
                                      onTap: () {
                                        controller.startTimer();
                                      },
                                    ),
                                  ),
                                ],
                              ),

                            if (controller.isRunning.value ||
                                controller.isPaused.value)
                              Row(
                                children: [
                                  Expanded(
                                    child: timerActionButton(
                                      context: context,
                                      label: controller.isRunning.value
                                          ? 'pause'.tr
                                          : 'resume'.tr,
                                      color: AppColors.timerPause,
                                      onTap: () {
                                        if (controller.isRunning.value) {
                                          controller.pauseTimer();
                                        } else {
                                          controller.resumeTimer();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(height: 20),
                            if (controller.isRunning.value ||
                                controller.isPaused.value)
                              const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: timerActionButton(
                                    context: context,
                                    label: 'cancel'.tr,
                                    color: AppColors.timerDanger,
                                    onTap: () {
                                      controller.cancelTimer();
                                      Get.back();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: timerActionButton(
                                    context: context,
                                    label: 'done'.tr,
                                    color: AppColors.timerPrimary,
                                    onTap: () {
                                      controller.completeTimer();
                                      Get.back();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      onNavigationTap: (index) {
        final mainController = Get.find<MainController>();
        mainController.changeTab(index);
        if (Get.currentRoute != Routes.HOME) {
          Get.offAllNamed(Routes.HOME);
        }
      },
    );
  }
}
