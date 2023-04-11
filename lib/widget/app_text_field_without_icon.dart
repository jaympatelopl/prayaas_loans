import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayaas_loans/config/color_config.dart';
import 'package:prayaas_loans/config/style_config.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';

class AppTextFieldWithoutIcon extends StatelessWidget {
  const AppTextFieldWithoutIcon({
    Key? key,
    required this.hintText,
    this.isShowSuffixIcon = false,
    this.prefixIcon = '',
    this.suffixIcon = '',
    this.isObscureText = false,
    this.onPressSuffix,
    this.isShowPassword = false,
    this.maxLength = 40,
    this.inputType = TextInputType.text,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);
  final String hintText;
  final bool isShowSuffixIcon;
  final String prefixIcon;
  final String suffixIcon;
  final bool isObscureText;
  final bool isShowPassword;
  final VoidCallback? onPressSuffix;
  final int maxLength;
  final TextInputType? inputType;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        controller: controller,
        obscureText: isObscureText,
        maxLength: maxLength,
        keyboardType: inputType,
        style: StyleConfig.regularText16,
        decoration: InputDecoration(
          hintStyle: StyleConfig.regularText16.copyWith(
            color: ColorConfig.darkGreyColor,
          ),
          label: Text(
            hintText,
            style: StyleConfig.regularText16.copyWith(
              color: ColorConfig.darkGreyColor,
            ),
          ),
          hintText: hintText,
          counterText: AppString.emptyText,
          border: buildUnderlineInputBorderWidget(),
          enabledBorder: buildUnderlineInputBorderWidget(),
          disabledBorder: buildUnderlineInputBorderWidget(),
          focusedBorder: buildUnderlineInputBorderWidget(),
          contentPadding: EdgeInsets.only(bottom: 12.h, top: -5.h),
          prefixIconConstraints: BoxConstraints(minWidth: 24.w, maxHeight: 24.h),
        ),
        onChanged: onChanged,

        // Add prefix icon if needed
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(right: 20),
        //   child: SvgPicture.asset(prefixIcon),
        // ),

        // Add suffix icon if needed
        // suffixIconConstraints:
        //     isShowSuffixIcon ? BoxConstraints(minWidth: 24.w, maxHeight: 24.h) : const BoxConstraints(),
        // suffixIcon: isShowSuffixIcon && suffixIcon.isNotEmpty
        //     ? GestureDetector(
        //         onTap: onPressSuffix,
        //         child: Padding(
        //           padding: const EdgeInsets.only(right: 20),
        //           child: SvgPicture.asset(
        //             suffixIcon,
        //             colorFilter: isShowPassword
        //                 ? const ColorFilter.mode(ColorConfig.greyColor, BlendMode.srcIn)
        //                 : const ColorFilter.mode(ColorConfig.blackColor, BlendMode.srcIn),
        //           ),
        //         ),
        //       )
        //     : const SizedBox(),
      ),
    );
  }

  UnderlineInputBorder buildUnderlineInputBorderWidget() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorConfig.extraLightGreyColor,
        width: 1.w,
      ),
    );
  }
}
