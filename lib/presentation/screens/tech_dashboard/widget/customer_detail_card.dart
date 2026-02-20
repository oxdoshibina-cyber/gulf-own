import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class CustomerDetailCard extends StatefulWidget {
  final String customerName;
  final String mobileNumber;
  final String brand;
  final String model;
  final String status;
  final String technician;
  final String relocateTechnician;
  final String cost;
  const CustomerDetailCard({
    super.key,
    required this.customerName,
    required this.mobileNumber,
    required this.brand,
    required this.model,
    required this.status,
    required this.technician,
    required this.relocateTechnician,
    required this.cost,
  });

  @override
  State<CustomerDetailCard> createState() => _CustomerDetailCardState();
}

class _CustomerDetailCardState extends State<CustomerDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.customerName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kLargeTextStyle(
                  fontColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              AppSpacing.h10,
              Text(
                widget.mobileNumber,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.darkColor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brand",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.textLightColor,
                  fontSize: 14.sp,
                ),
              ),
              AppSpacing.h10,
              Text(
                widget.brand,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Model",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.textLightColor,
                  fontSize: 14.sp,
                ),
              ),
              AppSpacing.h10,
              Text(
                widget.model,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Status",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.textLightColor,
                  fontSize: 14.sp,
                ),
              ),
              AppSpacing.h10,
              Text(
                widget.status,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.redColor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Technician",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.textLightColor,
                  fontSize: 14.sp,
                ),
              ),
              AppSpacing.h10,
              Text(
                widget.technician,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Relocate Tech",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.redColor,
                  fontSize: 14.sp,
                ),
              ),
              AppSpacing.h10,
              Text(
                widget.relocateTechnician,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Estimate Cost",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.textLightColor,
                  fontSize: 14.sp,
                ),
              ),
              AppSpacing.h10,
              Text(
                widget.cost,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w700,
                  fontColor: AppColors.greenColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}