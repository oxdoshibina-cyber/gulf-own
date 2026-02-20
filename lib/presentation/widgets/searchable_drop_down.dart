import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class SearchableDropdown<T> extends StatefulWidget {
  final List<T> items;
  final ValueNotifier<T?> selectedNotifier;
  final String Function(T) itemAsString;

  final String? hintText;
  final String? label;
  final Color? fillColor;
  final Color? borderColor;
  final String? Function(T?)? validatorFunction;

  /// ➕ Optional Add button
  final String? addButtonText;
  final VoidCallback? onAddTap;

  const SearchableDropdown({
    super.key,
    required this.items,
    required this.selectedNotifier,
    required this.itemAsString,
    this.hintText,
    this.label,
    this.fillColor,
    this.borderColor,
    this.addButtonText,
    this.onAddTap,
    this.validatorFunction,
  });

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🏷️ Label
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyle.kTitleMediumTextStyle(
              fontColor: AppColors.textLightColor,
            ),
          ),
          AppSpacing.h8,
        ],

        /// 🔽 Dropdown
        ValueListenableBuilder<T?>(
          valueListenable: widget.selectedNotifier,
          builder: (context, selectedValue, _) {
            return DropdownButtonFormField2<T>(
              validator: widget.validatorFunction,
              isExpanded: true,
              value: selectedValue,
              hint: Text(
                widget.hintText ?? 'Select',
                style: AppTextStyle.kTitleMediumTextStyle(
                  fontColor: AppColors.textLightColor,
                ),
              ),

              /// 📋 ITEMS
              items: widget.items
                  .map(
                    (item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        widget.itemAsString(item),
                        style: AppTextStyle.kTitleMediumTextStyle(
                          fontColor: AppColors.darkColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),

              /// 🔄 CHANGE
              onChanged: (value) {
                widget.selectedNotifier.value = value;
                _searchController.clear();
              },

              /// 🔍 SEARCH CONFIG
              dropdownSearchData: DropdownSearchData(
                searchController: _searchController,
                searchInnerWidgetHeight: 60,
                searchInnerWidget: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: const Icon(Icons.search),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),

                          /// ➕ Add button
                          if (widget.addButtonText != null &&
                              widget.onAddTap != null) ...[
                            SizedBox(width: 8.w),
                            InkWell(
                              onTap: widget.onAddTap,
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  widget.addButtonText!,
                                  style: AppTextStyle.kTitleSmallTextStyle(
                                    fontColor: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                  ],
                ),

                /// 🔎 MATCH LOGIC
                searchMatchFn: (item, searchValue) {
                  return widget
                      .itemAsString(item.value as T)
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              ),

              /// 🎨 DECORATION
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: widget.fillColor ?? AppColors.whiteColor,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 18.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? AppColors.dividerColor,
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? AppColors.primaryColor,
                    width: 1.4,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
