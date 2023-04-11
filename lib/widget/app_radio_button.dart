import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayaas_loans/config/color_config.dart';
import 'package:prayaas_loans/config/style_config.dart';
import 'package:prayaas_loans/res/constant/image_constant.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({Key? key, required this.title, required this.onPress, required this.isSelected}) : super(key: key);
  final String title;
  final VoidCallback onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? ColorConfig.parrotGreenColor : ColorConfig.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: StyleConfig.smallText,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    isSelected ? AppImage.radioFillIcon : AppImage.radioIcon,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
