import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/assign_work_dialog.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class TechnicianAssignTicket extends StatelessWidget {
  final String technicianName;
  final String mobileNumber;
  final String workCount;
  final String status;
  final int entryNo;
  final int technicianId;
  final bool isAssigned;

  const TechnicianAssignTicket({
    super.key,
    required this.technicianName,
    required this.mobileNumber,
    required this.workCount,
    required this.status,
    required this.isAssigned,
    required this.entryNo,
    required this.technicianId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Status Chip
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minHeight: 30.h,
              minWidth: 80.w,
              maxHeight: 40.h,
              maxWidth: 140.w,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: isAssigned
                  ? AppColors.opacityGreenColor
                  : AppColors.opacityRedColor,
            ),
            child: Text(
              isAssigned ? "FREE" : "ENGAGED",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kTitleSmallTextStyle(
                fontColor: isAssigned
                    ? AppColors.greenColor
                    : AppColors.redColor,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            ),
          ),

          AppSpacing.h14,

          // Customer Name
          Text(
            technicianName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.kLargeTextStyle(
              fontColor: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          ),

          AppSpacing.h14,

          // Mobile Number
          Text(
            mobileNumber,
            style: AppTextStyle.kTitleMediumTextStyle(
              fontSize: 15.sp,
              fontColor: AppColors.darkColor,
            ),
          ),

          AppSpacing.h14,

          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Work Count",
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.textLightColor,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                "Status",
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.textLightColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),

          AppSpacing.h14,

          // Data Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                workCount,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                status,
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontWeight: FontWeight.w600,
                  fontColor: status == "ACTIVE"
                      ? AppColors.greenColor
                      : AppColors.redColor,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),

          AppSpacing.h14,

          // Buttons Row (Figma-Perfect)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CALL BUTTON
              Expanded(
                child: SizedBox(
                  height: 46.h,
                  width: 146.w,
                  child: ContainerButton(
                    radius: BorderRadius.circular(12.r),
                    isWidget: true,
                    onTap: () {},
                    color: AppColors.primaryColor,
                    isChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgRes.call, height: 18.h),
                        AppSpacing.w8,
                        Text(
                          "Call",
                          style: AppTextStyle.kPageHeadingTextStyle(
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.whiteColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              AppSpacing.w12, // small gap between them
              // WORK ASSIGNED BUTTON
              Expanded(
                child: SizedBox(
                  height: 46.h,
                  width: 146.w,
                  child: ContainerButton(
                    radius: BorderRadius.circular(12.r),
                    isWidget: true,
                    border: Border.all(color: AppColors.primaryColor),
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AssignWorkDialog(
                            technicianName: technicianName,
                            entryNo: entryNo,
                            technicianId: technicianId,
                          );
                        },
                      );
                    },
                    color: AppColors.whiteColor,
                    isChild: Center(
                      child: Text(
                        "Work Assigned?",
                        style: AppTextStyle.kPageHeadingTextStyle(
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.primaryColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
