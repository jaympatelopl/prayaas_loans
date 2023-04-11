import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setting_logic.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SettingController>();

    return const SafeArea(
        child: Scaffold(
      body: Text("Hyyy"),
    ));
  }
}
