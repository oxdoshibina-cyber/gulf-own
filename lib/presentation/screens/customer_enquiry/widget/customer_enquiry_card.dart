import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class CustomerEnquiryCard extends StatelessWidget {
  final VoidCallback onTap;
  final String tokenNumber;
  final bool isMainStatus;
  final String customerName;
  final String mobileNumber;
  final String address;
  final String cost;
  const CustomerEnquiryCard({
    super.key,
    required this.onTap,
    required this.tokenNumber,
    this.isMainStatus = false,
    required this.customerName,
    required this.mobileNumber,
    required this.address,
    required this.cost,
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
              blurRadius: 5.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ✅ prevents vertical overflow
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header Row
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
                    color: isMainStatus
                        ? AppColors.opacityGreenColor
                        : AppColors.opacityRedColor,
                  ),
                  height: 30.h,
                  width: 110.w,
                  child: isMainStatus
                      ? Text(
                          "Completed",
                          style: AppTextStyle.kPageHeadingTextStyle(
                            fontColor: AppColors.greenColor,
                          ),
                        )
                      : Text(
                          "Pending",
                          style: AppTextStyle.kPageHeadingTextStyle(
                            fontColor: AppColors.redColor,
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
            _sectionTitle("Estimate Cost"),
            Text(
              cost,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontWeight: FontWeight.w700,
                fontColor: AppColors.greenColor,
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
