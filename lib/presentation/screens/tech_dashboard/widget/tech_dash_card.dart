import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class TechDashCard extends StatelessWidget {
  final String customerName;
  final String mobileNumber;
  final String brand;
  final String model;
  final String assignDate;
  final String deliveryDate;
  final String technician;
  final String amount;
  final String status;
  final VoidCallback onTap;

  const TechDashCard({
    super.key,
    required this.customerName,
    required this.mobileNumber,
    required this.brand,
    required this.model,
    required this.assignDate,
    required this.deliveryDate,
    required this.technician,
    required this.amount,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// STATUS BADGE
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.opacityGreenColor,
              ),
              child: Text(
                status,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.greenColor,
                ),
              ),
            ),

            AppSpacing.h14,

            /// CUSTOMER NAME
            Text(
              customerName,
              style: AppTextStyle.kLargeTextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                fontColor: AppColors.primaryColor,
              ),
            ),

            AppSpacing.h6,

            /// MOBILE NUMBER
            Text(
              mobileNumber,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            AppSpacing.h16,

            /// ASSIGN DATE + DELIVERY DATE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dateColumn("Assign Date", assignDate),
                dateColumn("Delivery Date", deliveryDate, highlight: true),
              ],
            ),

            AppSpacing.h16,

            /// BRAND + MODEL
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                infoColumn("Brand", brand),
                infoColumn("Model", model),
              ],
            ),

            AppSpacing.h16,

            /// TECHNICIAN
            infoColumn("Technician", technician),

            AppSpacing.h14,
            Divider(color: AppColors.dividerColor),
            AppSpacing.h14,

            /// COST + BUTTON (Updated)
            Row(
              children: [
                /// COST
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Estimate Cost",
                        style: AppTextStyle.kTitleSmallTextStyle(
                          fontColor: AppColors.textLightColor,
                        ),
                      ),
                      AppSpacing.h4,
                      Text(
                        amount,
                        style: AppTextStyle.kAmountTextStyle(), // cleaner
                      ),
                    ],
                  ),
                ),

                AppSpacing.w14,

                /// CALL BUTTON
                ContainerButton(
                  radius: BorderRadius.circular(12.r),
                  height: 48.h,
                  width: 110.w,
                  onTap: onTap,
                  isWidget: true,
                  isChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(SvgRes.call, height: 18.h),
                      AppSpacing.w8,
                      Text("Cust Call", style: AppTextStyle.kButtonTextStyle()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ------------------------
  /// SMALL UI COMPONENTS
  /// ------------------------

  Widget infoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.kTitleSmallTextStyle(
            fontColor: AppColors.textLightColor,
          ),
        ),
        AppSpacing.h4,
        Text(
          value,
          style: AppTextStyle.kTitleMediumTextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget dateColumn(String title, String value, {bool highlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.kTitleSmallTextStyle(
            fontColor: AppColors.textLightColor,
          ),
        ),
        AppSpacing.h4,
        Text(
          value,
          style: AppTextStyle.kTitleMediumTextStyle(
            fontWeight: FontWeight.w700,
            fontColor: highlight
                ? AppColors.greenColor
                : AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
