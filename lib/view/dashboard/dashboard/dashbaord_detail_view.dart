import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:prayaas_loans/config/color_config.dart';
import 'package:prayaas_loans/config/style_config.dart';
import 'package:prayaas_loans/res/common_method.dart';
import 'package:prayaas_loans/res/constant/image_constant.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';
import 'package:prayaas_loans/widget/common_widget.dart';

import 'dashboard_controller.dart';

class DashBoardDetailPage extends StatelessWidget {
  const DashBoardDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return Container(
      padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 20.r),
      decoration: BoxDecoration(
        gradient: AppCommonWidget.linearGradientWidget(),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          // Top header widget
          buildHeaderWidget(dashboardController),
          SizedBox(
            height: 25.h,
          ),
          // Add Application widget
          buildAddApplicationWidget(dashboardController),
          SizedBox(
            height: 20.h,
          ),
          buildCardListWidget(dashboardController),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppString.recentAdded,
              style: StyleConfig.semiBoldSmallText.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          buildUserListWidget(dashboardController)
        ],
      ),
    );
  }

  /// To header widget
  Widget buildHeaderWidget(DashboardController dashboardController) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.namaste,
              style: StyleConfig.regularLargeText,
            ),
            Text(
              AppString.pIMaker,
              style: StyleConfig.mediumLargeText,
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: dashboardController.onBackPress,
              child: Container(
                height: 40.r,
                width: 40.r,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImage.userImage),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  /// For Add Application
  Widget buildAddApplicationWidget(DashboardController dashboardController) {
    return GestureDetector(
      onTap: dashboardController.onAddApplication,
      child: Stack(
        children: [
          SizedBox(
            height: 130.h,
            width: 1.sw,
            child: SvgPicture.asset(
              AppImage.addApplicationLogo,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 132.h,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LottieBuilder.asset(
                    AppImage.fileGif,
                    width: 70.r,
                    height: 70.r,
                  ),
                  Text(
                    AppString.addNewApplication,
                    style: StyleConfig.mediumText.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  LottieBuilder.asset(
                    AppImage.addIconGif,
                    width: 40.r,
                    height: 40.r,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Card List for loan status
  Widget buildCardListWidget(DashboardController dashboardController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCardWidget(
          color: ColorConfig.orangeColor,
          title: AppString.pending,
          icon: AppImage.layers,
          onPress: dashboardController.onPressPendingCard,
        ),
        SizedBox(
          width: 15.w,
        ),
        buildCardWidget(
          color: ColorConfig.lightPinkColor,
          title: AppString.sanction,
          icon: AppImage.paperPlane,
          onPress: dashboardController.onPressSanctionCard,
        ),
        SizedBox(
          width: 15.w,
        ),
        buildCardWidget(
          color: ColorConfig.lightGreenColor,
          title: AppString.disbursed,
          icon: AppImage.listCheck,
          onPress: dashboardController.onPressDisbursedCard,
        ),
      ],
    );
  }

  /// For separate card
  Widget buildCardWidget({
    required Color color,
    required String title,
    required String icon,
    required VoidCallback onPress,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 120.h,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.r),
                  color: ColorConfig.whiteColor,
                ),
                child: SvgPicture.asset(
                  icon,
                  width: 20.r,
                  height: 20.r,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
                style: StyleConfig.semiBoldSmallText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// User List
  Widget buildUserListWidget(DashboardController dashboardController) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return buildUserDetailCardWidget(
            title: "Vaishali Patel",
            subTitle: " 12 March 2022",
            status: index == 0 || index == 8
                ? "Completed"
                : index == 1 || index == 5
                    ? "Pending"
                    : index == 6 || index == 3
                        ? "No status"
                        : "Rejected",
            data: "10174758",
            onTap: dashboardController.onPressUserDetailTile,
          );
        },
      ),
    );
  }

  Widget buildUserDetailCardWidget({
    required String title,
    required String subTitle,
    required String status,
    required String data,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: status == AppString.pendingStatus ? onTap : null,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 40.r,
        width: 40.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: CommonMethod.getBgColorByConnectorStatus(status),
        ),
        child: Center(
          child: Text(
            CommonMethod.getInitials(
              title,
            ),
            style: StyleConfig.mediumText.copyWith(
              color: CommonMethod.getColorByConnectorStatus(status),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: StyleConfig.smallText,
      ),
      subtitle: RichText(
        // Controls visual overflow
        overflow: TextOverflow.clip,
        // Controls how the text should be aligned horizontally
        textAlign: TextAlign.end,
        // Control the text direction
        textDirection: TextDirection.rtl,
        // Whether the text should break at soft line breaks
        softWrap: true,
        // Maximum number of lines for the text to span
        maxLines: 1,
        // The number of font pixels for each logical pixel
        textScaleFactor: 1,
        text: TextSpan(
          text: status,
          style: StyleConfig.regularExtraSmallText.copyWith(
            color: CommonMethod.getColorByConnectorStatus(status),
          ),
          children: <TextSpan>[
            TextSpan(
              text: subTitle,
              style: StyleConfig.regularExtraSmallText,
            ),
          ],
        ),
      ),
      trailing: SizedBox(
        width: 0.2.sw,
        child: Text(
          data,
          style: StyleConfig.semiBoldSmallText,
        ),
      ),
    );
  }
}
