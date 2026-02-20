import 'package:flutter/material.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? selectedValue;
  final List<T> items;
  final String Function(T) getLabel;
  final ValueChanged<T?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.getLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: selectedValue,
      items: items.map<DropdownMenuItem<T>>((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            getLabel(item),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyle.kLargeTextStyle(),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      ),
      dropdownColor: AppColors.whiteColor,
    );
  }
}
