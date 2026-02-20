import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class CompletedWorksCard extends StatelessWidget {
  final String customerName;
  final String mobileNumber;
  final String assignDate;
  final String deliveryDate;
  final String brand;
  final String model;
  final String technician;
  final String amount;
  final VoidCallback callOnTap;
  final VoidCallback onTap;

  const CompletedWorksCard({
    super.key,
    required this.customerName,
    required this.mobileNumber,
    required this.assignDate,
    required this.deliveryDate,
    required this.brand,
    required this.model,
    required this.technician,
    required this.amount,
    required this.callOnTap,
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
              blurRadius: 5.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customerName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kLargeTextStyle(
                fontColor: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            AppSpacing.h14,
            Text(
              mobileNumber,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontSize: 15.sp,
                fontColor: AppColors.darkColor,
              ),
            ),
            AppSpacing.h14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sectionTitle("Assign Date"),
                _sectionTitle("Delivery Date"),
              ],
            ),
            AppSpacing.h14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dataTitle(assignDate),
                _dataTitle(deliveryDate, color: AppColors.greenColor),
              ],
            ),
            AppSpacing.h14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_sectionTitle("Brand"), _sectionTitle("Model")],
            ),
            AppSpacing.h14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_dataTitle(brand), _dataTitle(model)],
            ),
            AppSpacing.h14,
            _dataTitle(technician),
            Divider(color: AppColors.dividerColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Estimate Cost",
                      style: AppTextStyle.kPageHeadingTextStyle(
                        fontColor: AppColors.textLightColor,
                        fontSize: 14.sp,
                      ),
                    ),
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
                          height: 18.h, // ✅ FIXED SIZE
                          width: 18.h,
                        ),
                        AppSpacing.w10,
                        Flexible(
                          // ✅ prevents overflow
                          child: Text(
                            'Cust Call',
                            overflow: TextOverflow.ellipsis, // ✅ just in case
                            style: AppTextStyle.kTitleMediumTextStyle(
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.whiteColor,
                            ),
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

  Widget _dataTitle(
    String title, {
    Color color = AppColors.darkColor,
    double size = 18,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        title,
        style: AppTextStyle.kPageHeadingTextStyle(
          fontColor: color,
          fontSize: size.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
