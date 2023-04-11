import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/config/color_config.dart';
import 'package:prayaas_loans/config/font_config.dart';
import 'package:prayaas_loans/config/style_config.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';
import 'package:prayaas_loans/widget/app_bar.dart';
import 'package:prayaas_loans/widget/app_button.dart';
import 'package:prayaas_loans/widget/common_widget.dart';

import 'otp_verification_controller.dart';

class OtpVerificationPage extends GetView<OtpVerificationController> {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpVerificationController = Get.find<OtpVerificationController>();

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 10.r, bottom: 40.r),
          decoration: BoxDecoration(
            gradient: AppCommonWidget.linearGradientWidget(),
          ),
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarWidget(
                      title: AppString.enterOTP,
                      onPress: otpVerificationController.onBackPress,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// OTP widget
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() {
                          return buildCustomOTPInputField(
                              number: otpVerificationController.otp.value.isNotEmpty
                                  ? otpVerificationController.otp.value[0]
                                  : '');
                        }),
                        Obx(() {
                          return buildCustomOTPInputField(
                              number: otpVerificationController.otp.value.length >= 2
                                  ? otpVerificationController.otp.value[1]
                                  : '');
                        }),
                        Obx(() {
                          return buildCustomOTPInputField(
                              number: otpVerificationController.otp.value.length >= 3
                                  ? otpVerificationController.otp.value[2]
                                  : '');
                        }),
                        Obx(() {
                          return buildCustomOTPInputField(
                              number: otpVerificationController.otp.value.length >= 4
                                  ? otpVerificationController.otp.value[3]
                                  : '');
                        }),
                        Obx(() {
                          return buildCustomOTPInputField(
                              number: otpVerificationController.otp.value.length >= 5
                                  ? otpVerificationController.otp.value[4]
                                  : '');
                        }),
                        Obx(() {
                          return buildCustomOTPInputField(
                              number: otpVerificationController.otp.value.length == 6
                                  ? otpVerificationController.otp.value[5]
                                  : '');
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      AppString.aadharInfoText,
                      style: StyleConfig.regularExtraSmallText,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                    /// Resend code text
                    Center(
                      child: RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.rtl,
                        softWrap: true,
                        maxLines: 1,
                        textScaleFactor: 1,
                        text: TextSpan(
                          text: AppString.doNotHaveCode,
                          style: StyleConfig.smallText,
                          children: <TextSpan>[
                            TextSpan(
                              text: AppString.requestAgain,
                              style: StyleConfig.smallText.copyWith(fontFamily: FontConfig.rubikBoldFont),
                              recognizer: TapGestureRecognizer()..onTap = otpVerificationController.onPressResendOTP,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    buildNumberWidget(otpVerificationController),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// Submit button
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 60.h,
                          child: Obx(() {
                            return AppButton(
                              onPress: otpVerificationController.onPressSubmit,
                              title: AppString.submit,
                              isButtonEnable: otpVerificationController.otp.value.length == 6 ? true : false,
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// For custom keyboard
  Widget buildNumberWidget(OtpVerificationController otpVerificationController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildButtonWidget(number: 1, onPress: () => otpVerificationController.onOtpChange(1)),
            buildButtonWidget(number: 2, onPress: () => otpVerificationController.onOtpChange(2)),
            buildButtonWidget(number: 3, onPress: () => otpVerificationController.onOtpChange(3)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildButtonWidget(number: 4, onPress: () => otpVerificationController.onOtpChange(4)),
            buildButtonWidget(number: 5, onPress: () => otpVerificationController.onOtpChange(5)),
            buildButtonWidget(number: 6, onPress: () => otpVerificationController.onOtpChange(6)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildButtonWidget(number: 7, onPress: () => otpVerificationController.onOtpChange(7)),
            buildButtonWidget(number: 8, onPress: () => otpVerificationController.onOtpChange(8)),
            buildButtonWidget(number: 9, onPress: () => otpVerificationController.onOtpChange(9)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildButtonWidget(number: 1, isShowWidget: false, onPress: null),
            buildButtonWidget(number: 0, onPress: () => otpVerificationController.onOtpChange(0)),
            buildButtonWidget(number: 3, isShowIcon: true, onPress: () => otpVerificationController.onOtpChange(10)),
          ],
        ),
      ],
    );
  }

  /// For custom keyboard button
  Widget buildButtonWidget({
    required int number,
    bool isShowIcon = false,
    bool isShowWidget = true,
    VoidCallback? onPress,
  }) {
    return SizedBox(
      height: 60.h,
      child: IconButton(
        onPressed: onPress,
        icon: isShowIcon
            ? const Icon(
                Icons.backspace_outlined,
                color: ColorConfig.blackColor,
              )
            : isShowWidget
                ? Text(
                    '$number',
                    style: StyleConfig.regularLargeText.copyWith(fontSize: 28.sp),
                  )
                : Text(
                    '$number',
                    style: StyleConfig.regularLargeText.copyWith(
                      color: ColorConfig.whiteColor.withOpacity(0.1),
                    ),
                  ),
      ),
    );
  }

  /// For show otp number
  Widget buildCustomOTPInputField({
    required String number,
  }) {
    return Column(
      children: [
        Text(
          number,
          style: StyleConfig.mediumLargeText.copyWith(fontSize: 26.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 1.5.h,
          width: 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: ColorConfig.primaryColor),
          ),
        )
      ],
    );
  }
}
