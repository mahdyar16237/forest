import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/modules/detaile/home/view_home/view_home.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_view/Statistics_view.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_view/Settings_view.dart';
import 'package:forest/app/modules/main/main_controllers/main_controller.dart';
import 'package:forest/app/modules/main/widgets/main_scaffold.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  List<Widget> get _pages => [
    const ViewHome(),
    const StatisticsView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(body: Obx(() => _pages[controller.currentIndex.value]));
  }
}
