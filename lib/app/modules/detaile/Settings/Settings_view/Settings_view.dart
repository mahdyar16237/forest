import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/core/localization/locale_controller.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_controller/Settings_controller.dart';
import 'package:forest/app/modules/detaile/Settings/widgets/settings_profile_card.dart';
import 'package:forest/app/modules/detaile/Settings/widgets/settings_section_card.dart';
import 'package:forest/app/modules/detaile/Settings/widgets/settings_sheets.dart';
import 'package:forest/app/modules/detaile/Settings/widgets/settings_tile.dart';
import 'package:forest/app/widgets/language_dialog.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = Get.find<LocaleController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundSettings,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Obx(
                  () => settingsProfileCard(
                    name: controller.displayName.value,
                    email: controller.email.value,
                    onEdit: () {
                      Get.snackbar(
                        'settings'.tr,
                        'coming_soon'.tr,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              settingsSectionCard(
                children: [
                  Obx(
                    () => settingsTile(
                      icon: Icons.volume_up_rounded,
                      title: 'sound'.tr,
                      trailingText: controller.soundPack.value,
                      onTap: () => showSoundPickerSheet(
                        context: context,
                        controller: controller,
                      ),
                    ),
                  ),
                  const Divider(height: 0),
                  Obx(
                    () => settingsTile(
                      icon: Icons.notifications_active_rounded,
                      title: 'notifications'.tr,
                      trailing: Switch(
                        value: controller.notificationsEnabled.value,
                        activeColor: const Color(0xFF2F6B32),
                        onChanged: controller.toggleNotifications,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              settingsSectionHeader(text: 'default_time'.tr),
              const SizedBox(height: 12),
              settingsSectionCard(
                children: [
                  Obx(
                    () => settingsTile(
                      icon: Icons.forest_rounded,
                      title: 'focus_timer'.tr,
                      trailingText:
                          '${controller.focusMinutes.value} ${'minutes_short'.tr}',
                      onTap: () => showDurationPickerSheet(
                        context: context,
                        title: 'focus_timer'.tr,
                        initialValue: controller.focusMinutes.value,
                        onSelected: controller.updateFocusDuration,
                      ),
                    ),
                  ),
                  const Divider(height: 0),
                  Obx(
                    () => settingsTile(
                      icon: Icons.spa_rounded,
                      title: 'short_break'.tr,
                      trailingText:
                          '${controller.shortBreakMinutes.value} ${'minutes_short'.tr}',
                      onTap: () => showDurationPickerSheet(
                        context: context,
                        title: 'short_break'.tr,
                        initialValue: controller.shortBreakMinutes.value,
                        onSelected: controller.updateShortBreak,
                      ),
                    ),
                  ),
                  const Divider(height: 0),
                  Obx(
                    () => settingsTile(
                      icon: Icons.local_florist_rounded,
                      title: 'long_break'.tr,
                      trailingText:
                          '${controller.longBreakMinutes.value} ${'minutes_short'.tr}',
                      onTap: () => showDurationPickerSheet(
                        context: context,
                        title: 'long_break'.tr,
                        initialValue: controller.longBreakMinutes.value,
                        onSelected: controller.updateLongBreak,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              settingsSectionCard(
                children: [
                  settingsTile(
                    icon: Icons.public_rounded,
                    title: 'language'.tr,
                    trailingText:
                        localeController.locale.value.languageCode == 'fa'
                        ? 'persian'.tr
                        : 'english'.tr,
                    onTap: () => showLanguageDialog(context, localeController),
                  ),
                  const Divider(height: 0),
                  Obx(
                    () => settingsTile(
                      icon: Icons.info_rounded,
                      title: 'version'.tr,
                      trailingText: controller.appVersion.value,
                    ),
                  ),
                  const Divider(height: 0),
                  settingsTile(
                    icon: Icons.help_outline_rounded,
                    title: 'help_support'.tr,
                    onTap: () {
                      Get.snackbar(
                        'help_support'.tr,
                        'coming_soon'.tr,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    showChevron: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
