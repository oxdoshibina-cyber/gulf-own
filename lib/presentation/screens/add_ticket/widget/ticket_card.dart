// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class TicketViewCard extends StatelessWidget {
  final String tokenNumber;
  final String date;
  final String customerName;
  final String mobileNumber;
  final String address;
  final String customerFindings;
  final VoidCallback onTap;

  const TicketViewCard({
    super.key,
    required this.tokenNumber,
    required this.date,
    required this.customerName,
    required this.mobileNumber,
    required this.address,
    required this.customerFindings,
    required this.onTap,
  });

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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tokenNumber,
                  style: AppTextStyle.kPageHeadingTextStyle(
                    fontColor: AppColors.textLightColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.opacityPrimaryColor,
                  ),
                  height: 30.h,
                  width: 110.w,
                  child: Text(
                    date,
                    style: AppTextStyle.kPageHeadingTextStyle(
                      fontColor: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),

            AppSpacing.h14,

            // 🔹 Customer Name
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

            AppSpacing.h14,

            Text(
              mobileNumber,
              style: AppTextStyle.kTitleMediumTextStyle(fontSize: 14.sp),
            ),

            AppSpacing.h14,

            // 🔹 Address Section
            _sectionTitle("Address"),
            Text(
              address,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),

            AppSpacing.h14,

            // 🔹 Customer Findings
            _sectionTitle("Customer Findings"),
            Text(
              customerFindings,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔸 Section Title Widget
  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        title,
        style: AppTextStyle.kPageHeadingTextStyle(
          fontColor: AppColors.textLightColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
