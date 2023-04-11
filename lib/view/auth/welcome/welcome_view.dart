import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final welcomeController = Get.find<WelcomeController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [],
            )),
      ),
    );
  }
}
