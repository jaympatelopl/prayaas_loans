import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayaas_loans/config/color_config.dart';
import 'package:prayaas_loans/config/style_config.dart';

// Common button widget
class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.onPress, required this.title, this.isButtonEnable = true}) : super(key: key);
  final VoidCallback onPress;
  final String title;
  final bool isButtonEnable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: 1.sw,
      child: ElevatedButton(
        onPressed: isButtonEnable ? onPress : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isButtonEnable ? ColorConfig.primaryColor : ColorConfig.lightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Text(
          title,
          style:
              isButtonEnable ? StyleConfig.mediumText : StyleConfig.mediumText.copyWith(color: ColorConfig.blackColor),
        ),
      ),
    );
  }
}
