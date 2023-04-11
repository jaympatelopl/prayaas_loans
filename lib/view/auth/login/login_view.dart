import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/config/style_config.dart';
import 'package:prayaas_loans/res/constant/image_constant.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';
import 'package:prayaas_loans/widget/app_button.dart';
import 'package:prayaas_loans/widget/app_text_field.dart';
import 'package:prayaas_loans/widget/progress_loader.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: SvgPicture.asset(
                    AppImage.appBg,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  // height: 1.sh,
                  // width: 1.sw,
                  padding: EdgeInsets.all(20.r),
                  child: CustomScrollView(
                    reverse: true,
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 80.h),
                            Text(
                              AppString.welcome,
                              style: StyleConfig.smallText,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              AppString.partnerLogin,
                              style: StyleConfig.semiBoldExtraLargeText,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            AppTextField(
                              hintText: AppString.usernameHint,
                              prefixIcon: AppImage.userIcon,
                              controller: loginController.userIdController,
                              // onChanged: loginController.onUserNameChange,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Obx(() {
                              return loginController.isShowPasswordField.value
                                  ? AppTextField(
                                      controller: loginController.passwordController,
                                      hintText: AppString.password,
                                      prefixIcon: AppImage.keyIcon,
                                      isObscureText: loginController.isPasswordVisible.value,
                                      isShowSuffixIcon: true,
                                      suffixIcon: AppImage.eyeIcon,
                                      onPressSuffix: loginController.onPressEyeIcon,
                                      isShowPassword: loginController.isPasswordVisible.value,
                                      // onChanged: loginController.onPasswordChange,
                                    )
                                  : const SizedBox();
                            }),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: loginController.onSwitchTap,
                                  child: SizedBox(
                                    width: 36.w,
                                    height: 20.h,
                                    child: Obx(() {
                                      return SvgPicture.asset(
                                        loginController.isRememberSwitchOn.value
                                            ? AppImage.onButton
                                            : AppImage.offButton,
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  AppString.remember,
                                  style: StyleConfig.mediumSmallText,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Flexible(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 60.h,
                                  child: AppButton(onPress: loginController.onPressLoginButton, title: AppString.login),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                AppString.enterCredentialText,
                                style: StyleConfig.regularExtraSmallText,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // bottomNavigationBar: buildBottomNavigationWidget(loginController),
          ),
          Obx(() {
            return loginController.isShowLoader.value ? const ProgressLoader() : const SizedBox();
          }),
        ],
      ),
    );
  }

  /// For bottom button and text
  Widget buildBottomNavigationWidget(LoginController loginController) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(onPress: loginController.onPressLoginButton, title: AppString.login),
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppString.enterCredentialText,
            style: StyleConfig.regularExtraSmallText,
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
