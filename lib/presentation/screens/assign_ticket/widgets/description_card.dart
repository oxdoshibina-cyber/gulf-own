import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';

class DescriptionCard extends StatefulWidget {
  final String description;
  final String remarks;
  final bool isDeleteIcon;
  const DescriptionCard({
    super.key,
    required this.description,
    required this.remarks,
    this.isDeleteIcon = false,
  });

  @override
  State<DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryColor,
                ),
              ),
              AppSpacing.h12,
              Text(
                widget.remarks,
                style: AppTextStyle.kPageHeadingTextStyle(
                  fontColor: AppColors.darkColor,
                ),
              ),
            ],
          ),
          widget.isDeleteIcon
              ? ResponsiveSvgIcon(asset: SvgRes.deleteIcon, size: 20.sp)
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
