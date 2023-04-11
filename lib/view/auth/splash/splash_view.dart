import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/widget/app_button.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 100.w,
          child: AppButton(
            title: "Button",
            onPress: splashController.onPressButton,
          ),
        ),
      ),
    );
  }
}
