import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';

class CheckListWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String itemName;
  final String checkList;
  final VoidCallback onDeleteTap;
  const CheckListWidget({
    super.key,
    required this.onTap,
    required this.itemName,
    required this.checkList,
    required this.onDeleteTap,
  });

  @override
  State<CheckListWidget> createState() => _CheckListWidgetState();
}

class _CheckListWidgetState extends State<CheckListWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min, // ✅ prevents vertical overflow
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryColor,
                  ),
                ),
                Text(
                  widget.checkList,
                  style: AppTextStyle.kTitleMediumTextStyle(),
                ),
              ],
            ),
            GestureDetector(
              onTap: widget.onDeleteTap,
              child: ResponsiveSvgIcon(asset: SvgRes.deleteIcon, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
