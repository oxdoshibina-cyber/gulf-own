import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class SparePartsHistoryCard extends StatelessWidget {
  final String spareName;
  final String customerName;
  final String date;
  final String cost;
  const SparePartsHistoryCard({
    super.key,
    required this.spareName,
    required this.customerName,
    required this.date,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            spareName,
            style: AppTextStyle.kTitleMediumTextStyle(
              fontColor: AppColors.primaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacing.h14,
          _dataTitle(customerName),
           AppSpacing.h14,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dataTitle(date),
              Text(
                cost,
                style: AppTextStyle.kLargeTextStyle(
                  fontColor: AppColors.greenColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dataTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(title, style: AppTextStyle.kPageHeadingTextStyle()),
    );
  }
}
