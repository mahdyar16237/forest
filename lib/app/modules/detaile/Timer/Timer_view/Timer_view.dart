import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/Timer/widget/container_timer.dart';
import 'package:forest/app/modules/detaile/Timer/widget/actionButton.dart';
import 'package:forest/app/modules/main/main_controllers/main_controller.dart';
import 'package:forest/app/modules/main/widgets/main_scaffold.dart';
import 'package:forest/app/routes/app_routes.dart';

class TimerView extends GetView<MainController> {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: const Color.fromARGB(255, 240, 229, 188),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 229, 188),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF2F3A2F),
          ),
          onPressed: Get.back,
        ),
        centerTitle: true,
        title: Text(
          'focus_timer'.tr,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF2F3A2F),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'focus_timer'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2F3A2F),
                ),
              ),
              const SizedBox(height: 120),
              timerCircle(context: context, progress: 0.55, timeLabel: '25:00'),
              const SizedBox(height: 170),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: timerActionButton(
                        context: context,
                        label: 'cancel'.tr,
                        color: const Color(0xFFD46A50),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: timerActionButton(
                        context: context,
                        label: 'done'.tr,
                        color: const Color(0xFF2F6B32),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onNavigationTap: (index) {
        controller.changeTab(index);
        if (Get.currentRoute != Routes.HOME) {
          Get.offAllNamed(Routes.HOME);
        }
      },
    );
  }
}
