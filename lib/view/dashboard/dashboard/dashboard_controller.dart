import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/view/dashboard/adhar_verifaction/adhar_verifaction_view.dart';
import 'package:prayaas_loans/view/dashboard/setting/setting_view.dart';

import 'dashbaord_detail_view.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> widgetOptions = [
    const DashBoardDetailPage(),
    const AadharVerifactionPage(),
    const SettingPage(),
  ];

  void onPressPendingCard() {}

  void onPressSanctionCard() {}

  void onPressDisbursedCard() {}

  void onPressUserDetailTile() {
    TGLog.d("onTappppp");
  }

  void onIndexChange(int index) {
    selectedIndex.value = index;
    TGLog.d("On index change--$index---${selectedIndex.value}");
    // if (index == 1) {
    //   onAddApplication();
    // }
  }

  void onAddApplication() {
    Get.to(() => const AadharVerifactionPage());
  }

  // On Back from back arrow
  void onBackPress() {
    Get.back();
  }
}
