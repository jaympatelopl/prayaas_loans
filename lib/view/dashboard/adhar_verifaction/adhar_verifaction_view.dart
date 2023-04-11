import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/config/style_config.dart';
import 'package:prayaas_loans/res/constant/image_constant.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';
import 'package:prayaas_loans/widget/app_bar.dart';
import 'package:prayaas_loans/widget/app_button.dart';
import 'package:prayaas_loans/widget/app_text_field.dart';
import 'package:prayaas_loans/widget/common_widget.dart';

import 'adhar_verifaction_controller.dart';

class AadharVerifactionPage extends GetView<AadharVerifactionController> {
  const AadharVerifactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aadharVerifactionController = Get.put(AadharVerifactionController());

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
                      title: AppString.newApplication,
                      onPress: aadharVerifactionController.onBackPress,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      AppString.applicantAadharNo,
                      style: StyleConfig.regularText16,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppTextField(
                      hintText: AppString.enterAadharNo,
                      prefixIcon: AppImage.aadharBadge,
                      maxLength: 12,
                      inputType: TextInputType.number,
                      controller: aadharVerifactionController.aadharController,
                      onChanged: aadharVerifactionController.onAadharChange,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(() {
                            return SizedBox(
                              child: aadharVerifactionController.aadharNumber.value.length == 12
                                  ? Text(
                                      AppString.aadharInfoText,
                                      style: StyleConfig.regularExtraSmallText,
                                    )
                                  : const SizedBox(),
                            );
                          }),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 60.h,
                            child: AppButton(
                              onPress: aadharVerifactionController.onPressSendOTP,
                              title: AppString.sendOTP,
                            ),
                          ),
                        ],
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
}
