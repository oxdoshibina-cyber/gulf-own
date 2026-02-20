import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/quality_check/widgets/show_quality_check_dialog.dart';

class QualityCheckDataCard extends StatelessWidget {
  final String tokenNumber;
  final String technicianName;
  final String employeeId;
  final String customerName;
  final String model;
  final bool approvalStatus;

  const QualityCheckDataCard({
    super.key,
    required this.tokenNumber,
    required this.technicianName,
    required this.employeeId,
    required this.customerName,
    required this.model,
    required this.approvalStatus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const ShowQualityCheckDialog();
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Content Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ID and Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tokenNumber,
                        style: AppTextStyle.kTitleMediumTextStyle(
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.textLightColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 6.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.opacityGreenColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          "Completed",
                          style: AppTextStyle.kPageHeadingTextStyle(
                            fontColor: AppColors.greenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h8,

                  // Technician Name
                  Text(
                    technicianName,
                    style: AppTextStyle.kButtonTextStyle(
                      fontSize: 20.sp,
                      fontColor: AppColors.primaryColor,
                    ),
                  ),
                  AppSpacing.h8,
                  Text(employeeId, style: AppTextStyle.kTitleMediumTextStyle()),
                  AppSpacing.h8,

                  // Customer Name
                  Text(
                    'Customer Name',
                    style: AppTextStyle.kTitleSmallTextStyle(fontSize: 14.sp),
                  ),
                  AppSpacing.h8,
                  Text(
                    customerName,
                    style: AppTextStyle.kTitleMediumTextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.h8,

                  // Model and Approval Status
                  Text(
                    'Model',
                    style: AppTextStyle.kPageHeadingTextStyle(
                      fontColor: AppColors.textLightColor,
                    ),
                  ),
                  AppSpacing.h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model,
                        style: AppTextStyle.kTitleMediumTextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        approvalStatus ? "Approved" : "Reject",
                        style: AppTextStyle.kStatusTextStyle(
                          fontColor: approvalStatus
                              ? AppColors.greenColor
                              : AppColors.redColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
