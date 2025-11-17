import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/localization/locale_controller.dart';
import 'package:forest/app/modules/detaile/home/widget_home/language_dialog.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('home_title'.tr),
        actions: [
          // button change language
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // show dialog select language
              showLanguageDialog(context, localeController);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('welcome'.tr, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('home_title'.tr),
          ],
        ),
      ),
    );
  }
}
