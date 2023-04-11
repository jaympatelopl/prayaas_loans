import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayaas_loans/config/color_config.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.blackColor.withOpacity(0.2),
      alignment: Alignment.center,
      child: SizedBox(
        height: 42.r,
        width: 42.r,
        child: CircularProgressIndicator(
          strokeWidth: 4.5.r,
          backgroundColor: ColorConfig.blackColor.withOpacity(0.3),
          valueColor: const AlwaysStoppedAnimation<Color>(
            ColorConfig.primaryColor,
          ),
        ),
      ),
    );
  }
}
