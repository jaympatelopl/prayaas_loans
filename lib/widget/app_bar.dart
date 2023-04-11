import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayaas_loans/config/style_config.dart';
import 'package:prayaas_loans/res/constant/image_constant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title, required this.onPress}) : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: onPress,
            child: SvgPicture.asset(
              AppImage.backArrow,
              height: 16.h,
              width: 16.w,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: StyleConfig.semiBoldMediumText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
