import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';

class SelectionWidget<T> extends StatelessWidget {
  final ValueNotifier<T> selectedNotifier;
  final T value;

  /// Called when this option is selected
  final ValueChanged<T> onSelected;

  /// Converts T → display text
  final String Function(T value) labelBuilder;

  final Color selectedColor;
  final Color unselectedBorderColor;
  final Color textColor;
  final Color checkMarkColor;
  final Color checkColor;

  const SelectionWidget({
    super.key,
    required this.selectedNotifier,
    required this.value,
    required this.onSelected,
    required this.labelBuilder,
    this.selectedColor = AppColors.greenColor,
    this.unselectedBorderColor = Colors.grey,
    this.textColor = AppColors.textLightColor,
    this.checkMarkColor = Colors.white,
    this.checkColor = AppColors.inProgressColor,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: selectedNotifier,
      builder: (context, selectedValue, _) {
        final bool isSelected = selectedValue == value;

        return GestureDetector(
          onTap: () => onSelected(value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            constraints: BoxConstraints(
              minWidth: 110.w,
              maxWidth: MediaQuery.of(context).size.width * 0.09,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: isSelected ? selectedColor : Colors.transparent,
              border: Border.all(
                color: isSelected ? selectedColor : unselectedBorderColor,
                width: 1.3.w,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.scale(
                  scale: 0.78,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (_) => onSelected(value),
                    checkColor: checkColor,
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      return states.contains(WidgetState.selected)
                          ? checkMarkColor
                          : Colors.transparent;
                    }),
                    side: BorderSide(
                      color: isSelected
                          ? checkMarkColor
                          : unselectedBorderColor,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                  ),
                ),
                AppSpacing.w6,
                Expanded(
                  child: Text(
                    labelBuilder(value),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
