import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/config/color_config.dart';
import 'package:prayaas_loans/res/constant/image_constant.dart';
import 'package:prayaas_loans/view/dashboard/dashboard/dashboard_controller.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key, required this.dashboardController}) : super(key: key);
  final DashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConfig.blackColor.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Obx(() {
                return SvgPicture.asset(
                  dashboardController.selectedIndex.value == 0 ? AppImage.homeIconGreen : AppImage.homeIcon,
                  fit: BoxFit.fill,
                );
              }),
              label: '',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.addIconGreen,
                fit: BoxFit.fill,
              ),
              label: '',
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Obx(() {
                return SvgPicture.asset(
                  dashboardController.selectedIndex.value == 2 ? AppImage.settingIconGreen : AppImage.settingIcon,
                  fit: BoxFit.fill,
                );
              }),
              label: '',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: dashboardController.onIndexChange,
          backgroundColor: ColorConfig.whiteColor,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
