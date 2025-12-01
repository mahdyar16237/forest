import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_controller/Settings_controller.dart';

void showSoundPickerSheet({
  required BuildContext context,
  required SettingsController controller,
}) {
  final List<String> options = ['Forest 1', 'Forest 2', 'Ocean', 'Rain'];
  Get.bottomSheet(
    Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              'sound'.tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ...options.map(
              (option) => ListTile(
                title: Text(option),
                onTap: () {
                  controller.updateSoundPack(option);
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ),
  );
}

void showDurationPickerSheet({
  required BuildContext context,
  required String title,
  required int initialValue,
  required ValueChanged<int> onSelected,
}) {
  final List<int> presets = [5, 10, 15, 20, 25, 30, 35, 45, 60];
  int tempValue = initialValue;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButton<int>(
                  value: tempValue,
                  items: presets
                      .map(
                        (value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value ${'minutes_short'.tr}'),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        tempValue = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.timerPrimary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      onSelected(tempValue);
                      Navigator.of(context).pop();
                    },
                    child: Text('apply'.tr),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void showEditProfileDialog({
  required BuildContext context,
  required SettingsController controller,
}) {
  final nameController = TextEditingController(
    text: controller.displayName.value,
  );
  final emailController = TextEditingController(text: controller.email.value);
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'edit_profile'.tr,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'full_name'.tr),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'full_name'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'email_address'.tr),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'email_address'.tr;
                  }
                  if (!GetUtils.isEmail(value.trim())) {
                    return 'invalid_email'.tr;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.timerPrimary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                controller.updateProfile(
                  name: nameController.text.trim(),
                  emailAddress: emailController.text.trim(),
                );
                Navigator.of(context).pop();
              }
            },
            child: Text('save_changes'.tr),
          ),
        ],
      );
    },
  );
}
