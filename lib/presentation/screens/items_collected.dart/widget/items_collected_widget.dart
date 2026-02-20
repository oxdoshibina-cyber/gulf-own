import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

import '../../../../core/assets/asset_resources.dart';
import '../../../../domain/items_collected/model/items_collected_response_model.dart';
import '../../../widgets/responsive_svg_icon.dart';

class ItemsCollectedWidget extends StatefulWidget {
  final ItemsCollectedResponseModel collectedItem;
  final VoidCallback onTap;
  final VoidCallback onDeleteTap;
  const ItemsCollectedWidget({
    super.key,
    required this.onTap,
    required this.collectedItem,
    required this.onDeleteTap,
  });

  @override
  State<ItemsCollectedWidget> createState() => _ItemsCollectedWidgetState();
}

class _ItemsCollectedWidgetState extends State<ItemsCollectedWidget> {
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
                  widget.collectedItem.iicName,
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryColor,
                  ),
                ),
                Text(
                  widget.collectedItem.iicStatus == 0 ? "Active" : "Inactive",
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
