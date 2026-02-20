import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/util/date_formatter.dart';

class SpareDataCard extends StatelessWidget {
  final String date;
  final String technicianName;
  final String empId;
  final String mobileNumber;
  final String customerName;
  final String brand;
  final String model;
  final VoidCallback onTap;
  final String status;
  // final bool isMainStatus;

  const SpareDataCard({
    super.key,
    required this.date,
    required this.technicianName,
    required this.empId,
    required this.mobileNumber,
    required this.customerName,
    required this.brand,
    required this.model,
    required this.onTap,
    required this.status,
    // required this.isMainStatus,
    // this.isMainStatus = false,
  });

  bool get isApproved => status.toLowerCase() == "approved";
  bool get isRejected => status.toLowerCase() == "rejected";
  bool get isRequested => status.toLowerCase() == "requested";

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
          mainAxisSize: MainAxisSize.min, // ✅ prevents vertical overflow
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormatter.formatDate(date),
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 37.h,
                  width: 116.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: isRequested
                        ? AppColors.opacitySecondColor
                        : isApproved
                        ? AppColors.opacityGreenColor
                        : AppColors.opacityRedColor,
                  ),

                  child: Text(
                    isRequested
                        ? "REQUESTED"
                        : isApproved
                        ? "APPROVED"
                        : "REJECTED",
                    style: AppTextStyle.kTitleSmallTextStyle(
                      fontWeight: FontWeight.w600,
                      fontColor: isRequested
                          ? AppColors.primaryColor
                          : isApproved
                          ? AppColors.greenColor
                          : AppColors.redColor,
                    ),
                  ),
                ),
              ],
            ),

            AppSpacing.h14,

            // 🔹 Customer Name
            Text(
              technicianName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kLargeTextStyle(
                fontColor: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),

            AppSpacing.h14,

            Text(
              empId,
              style: AppTextStyle.kTitleMediumTextStyle(fontSize: 14.sp),
            ),

            AppSpacing.h14,

            // 🔹 Address Section
            _sectionTitle("Customer Name"),
            Text(
              customerName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),

            AppSpacing.h14,

            // 🔹 Customer Findings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_sectionTitle("Brand"), _sectionTitle("Model")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  brand,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  model,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ],
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
