import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/config/color_config.dart';

import 'constant/string_constant.dart';

class CommonMethod {
  // For get color from status
  static Color? getColorByConnectorStatus(String status) {
    if (AppString.completedStatus == status) {
      return ColorConfig.greenColor;
    } else if (AppString.pendingStatus == status) {
      return ColorConfig.yellowColor;
    } else if (AppString.rejectedStatus == status) {
      return ColorConfig.redColor;
    } else {
      return ColorConfig.blueColor;
    }
  }

  // For get bg color from status
  static Color? getBgColorByConnectorStatus(String status) {
    if (AppString.completedStatus == status) {
      return ColorConfig.greenBgColor;
    } else if (AppString.pendingStatus == status) {
      return ColorConfig.yellowBgColor;
    } else if (AppString.rejectedStatus == status) {
      return ColorConfig.redBgColor.withOpacity(0.5);
    } else {
      return ColorConfig.blueColor.withOpacity(0.4);
    }
  }

  // For get first letter from name
  static String getInitials(String userName) =>
      userName.isNotEmpty ? userName.trim().split(' ').map((l) => l[0]).take(2).join() : '';

  // For Close keyboard
  static closeKeyboard() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  static bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(input);

  static bool isValidEmail(String input) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input);

  // Show snack bar for positive messages
  static showSnackBarSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.greenColor,
      colorText: ColorConfig.whiteColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r),
    );
  }

  // Show snack bar for error messages
  static showSnackBarError(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.redBgColor,
      colorText: ColorConfig.whiteColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 4),
      margin: EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r),
    );
  }

  // Show snack bar for info messages
  static showSnackBarInfo(String message, String title) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.lightGreyColor,
      colorText: ColorConfig.blackColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 4),
      margin: EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r),
    );
  }
}
