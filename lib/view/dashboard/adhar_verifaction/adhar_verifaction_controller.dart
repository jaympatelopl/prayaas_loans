import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/view/dashboard/otp_verification/otp_verification_binding.dart';
import 'package:prayaas_loans/view/dashboard/otp_verification/otp_verification_view.dart';

class AadharVerifactionController extends GetxController {
  RxString aadharNumber = "".obs;

  final aadharController = TextEditingController();

  // On Back from back arrow
  void onBackPress() {
    Get.back();
  }

  void onPressSendOTP() {
    Get.to(() => const OtpVerificationPage(), binding: OtpVerificationBinding());
  }

  void onAadharChange(String aadhar) {
    aadharNumber.value = aadharController.text;
  }

  @override
  void dispose() {
    aadharController.dispose();
    super.dispose();
  }
}
