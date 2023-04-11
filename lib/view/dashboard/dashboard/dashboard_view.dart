import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/widget/bottom_navigation_bar.dart';

import 'dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return dashboardController.widgetOptions[dashboardController.selectedIndex.value];
        }),
        bottomNavigationBar: BottomNavigationBarWidget(
          dashboardController: dashboardController,
        ),
      ),
    );
  }
}
