import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class TicketCard extends StatelessWidget {
  final String customerName;
  final String mobileNumber;
  final VoidCallback onTap;
  final String brand;
  final String model;
  final String status; // 🔥 SOURCE OF TRUTH
  final String technician;
  final String amount;

  const TicketCard({
    super.key,
    required this.customerName,
    required this.mobileNumber,
    required this.onTap,
    required this.brand,
    required this.model,
    required this.status,
    required this.technician,
    required this.amount,
  });

  // 🔹 STATUS HELPERS
  bool get isAssigned => status.toLowerCase() == "assigned";
  bool get isRelocate => status.toLowerCase() == "relocate";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// STATUS CHIP
            Container(
              alignment: Alignment.center,
              height: 37.h,
              width: 116.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: isRelocate
                    ? AppColors.opacitySecondColor
                    : isAssigned
                    ? AppColors.opacityGreenColor
                    : AppColors.opacityRedColor,
              ),
              child: Text(
                isRelocate
                    ? "RELOCATE"
                    : isAssigned
                    ? "ASSIGNED"
                    : "NOT ASSIGNED",
                style: AppTextStyle.kTitleSmallTextStyle(
                  fontWeight: FontWeight.w600,
                  fontColor: isRelocate
                      ? AppColors.primaryColor
                      : isAssigned
                      ? AppColors.greenColor
                      : AppColors.redColor,
                ),
              ),
            ),

            AppSpacing.h10,

            Text(
              customerName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kLargeTextStyle(
                fontColor: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),

            AppSpacing.h10,

            Text(
              mobileNumber,
              style: AppTextStyle.kTitleMediumTextStyle(fontSize: 16.sp),
            ),

            AppSpacing.h10,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_label("Brand"), _label("Model")],
            ),

            AppSpacing.h10,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_value(brand), _value(model)],
            ),

            AppSpacing.h10,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_label("Status"), _label("Technician")],
            ),

            AppSpacing.h10,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_value(status), _value(technician)],
            ),

            Divider(color: AppColors.dividerColor),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label("Estimate Cost"),
                    AppSpacing.h4,
                    Text(
                      amount,
                      style: AppTextStyle.kLargeTextStyle(
                        fontColor: AppColors.greenColor,
                      ),
                    ),
                  ],
                ),
                ContainerButton(
                  radius: BorderRadius.circular(12.r),
                  height: 40.h,
                  onTap: onTap,
                  isWidget: true,
                  isChild: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          SvgRes.call,
                          height: 18.h,
                          width: 18.h,
                        ),
                        AppSpacing.w10,
                        Text(
                          "Cust Call",
                          style: AppTextStyle.kTitleMediumTextStyle(
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: AppTextStyle.kPageHeadingTextStyle(
      fontColor: AppColors.textLightColor,
      fontSize: 14.sp,
    ),
  );

  Widget _value(String text) => Text(
    text,
    style: AppTextStyle.kTitleMediumTextStyle(fontWeight: FontWeight.w600),
  );
}
