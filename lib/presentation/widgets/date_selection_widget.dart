import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';

class DateSelectionWidget extends StatelessWidget {
  final DateTime? selectedFromDate;
  final DateTime? selectedToDate;
  final void Function()? onFromDateTapped;
  final void Function()? onToDateTapped;

  const DateSelectionWidget({
    super.key,
    this.selectedFromDate,
    this.selectedToDate,
    this.onFromDateTapped,
    this.onToDateTapped,
  });

  String _formatOrLabel(DateTime? date, String label) {
    if (date == null) return label;
    return DateFormat("dd-MM-yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// FROM DATE
        Expanded(
          child: InkWell(
            onTap: onFromDateTapped,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                border: Border.all(color: AppColors.greyColor, width: 0.7.w),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatOrLabel(selectedFromDate, "From Date"),
                    style: AppTextStyle.kTitleMediumTextStyle(
                      fontColor: AppColors.textLightColor,
                    ),
                  ),
                  ResponsiveSvgIcon(
                    asset: SvgRes.calenderIcon,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),

        AppSpacing.w12,

        /// TO DATE
        Expanded(
          child: InkWell(
            onTap: onToDateTapped,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                border: Border.all(color: AppColors.greyColor, width: 0.7.w),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatOrLabel(selectedToDate, "To Date"),
                    style: AppTextStyle.kTitleMediumTextStyle(
                      fontColor: AppColors.textLightColor,
                    ),
                  ),
                  ResponsiveSvgIcon(
                    asset: SvgRes.calenderIcon,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
