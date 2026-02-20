import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class BuildAccessoriesSection extends StatefulWidget {
  final ValueNotifier<List<String>> selectedAccessoriesNotifier;
  final List<String> accessories;
  const BuildAccessoriesSection({
    super.key,
    required this.selectedAccessoriesNotifier,
    required this.accessories,
  });

  @override
  State<BuildAccessoriesSection> createState() =>
      _BuildAccessoriesSectionState();
}

class _BuildAccessoriesSectionState extends State<BuildAccessoriesSection> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.selectedAccessoriesNotifier,
      builder: (context, selected, _) {
        return Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: widget.accessories.map((e) {
            return _buildAccessoryPill(e, selected.contains(e));
          }).toList(),
        );
      },
    );
  }

  Widget _buildAccessoryPill(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        final list = [...widget.selectedAccessoriesNotifier.value];

        if (list.contains(label)) {
          list.remove(label);
        } else {
          list.add(label);
        }

        widget.selectedAccessoriesNotifier.value = list;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.dividerColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontColor: isSelected
                    ? AppColors.whiteColor
                    : AppColors.darkColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isSelected) ...[
              AppSpacing.w8,
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Icon(
                  Icons.check,
                  size: 12.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
