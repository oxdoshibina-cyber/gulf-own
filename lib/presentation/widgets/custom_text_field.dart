import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class CustomTextField<T> extends StatefulWidget {
  final bool isTextField;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType? keyboardType;

  /// Generic validator → works for text field & dropdown
  final String? Function(T?)? validatorFunction;

  final List<T>? items;
  final T? selectedValue;
  final ValueNotifier<T?>? valueNotifier;
  final ValueChanged<T?>? onChanged;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final Color? fillColor;
  final Color? borderColor;
  final String? label;
  final TextStyle? hintStyle;

  final bool isSearch;
  final String? dropDownText;
  final String? dropDownHintText;
  final TextStyle? dropDownStyle;

  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.isTextField,
    this.controller,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.validatorFunction,
    this.items,
    this.selectedValue,
    this.valueNotifier,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.borderColor,
    this.label,
    this.hintStyle,
    this.isSearch = false,
    this.dropDownText,
    this.dropDownHintText,
    this.dropDownStyle,
    this.isPassword = false,
  });

  @override
  State<CustomTextField<T>> createState() => _CustomTextFieldState<T>();
}

class _CustomTextFieldState<T> extends State<CustomTextField<T>> {
  late TextEditingController searchController;

  OverlayEntry? overlayEntry;
  final layerLink = LayerLink();

  late ValueNotifier<List<T>> filteredNotifier;
  late ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();
    filteredNotifier = ValueNotifier(widget.items ?? []);
    obscureNotifier = ValueNotifier(true);
  }

  void showSearchDropdown() {
    final overlay = Overlay.of(context);
    RenderBox box = context.findRenderObject() as RenderBox;
    final size = box.size;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: Offset(0, size.height + 5),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.45,
              minHeight: 150,
            ),
            child: Material(
              elevation: 4,
              color: widget.fillColor ?? AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.dropDownText ?? "",
                          style:
                              widget.dropDownStyle ??
                              AppTextStyle.kTitleMediumTextStyle(),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),

                    AppSpacing.h10,

                    /// Search bar
                    TextFormField(
                      keyboardType: widget.keyboardType,
                      controller: searchController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: widget.dropDownHintText ?? "Search...",
                        suffixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onChanged: (value) {
                        filteredNotifier.value = widget.items!
                            .where(
                              (e) => e.toString().toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                            )
                            .toList();
                        overlayEntry?.markNeedsBuild();
                      },
                    ),

                    AppSpacing.h10,

                    /// List items
                    Expanded(
                      child: ValueListenableBuilder<List<T>>(
                        valueListenable: filteredNotifier,
                        builder: (context, filteredItems, _) {
                          return ListView.builder(
                            itemCount: filteredItems.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  filteredItems[index].toString(),
                                  style: AppTextStyle.kTitleMediumTextStyle(),
                                ),
                                onTap: () {
                                  widget.valueNotifier?.value =
                                      filteredItems[index];
                                  widget.onChanged?.call(filteredItems[index]);
                                  searchController.clear();
                                  FocusScope.of(
                                    context,
                                  ).unfocus(); // Close keyboard
                                  removeOverlay();
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry!);
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: AppTextStyle.kTitleMediumTextStyle(
                fontColor: AppColors.textLightColor,
              ),
            ),
            AppSpacing.h8,
          ],

          /// TEXT FIELD
          if (widget.isTextField)
            ValueListenableBuilder<bool>(
              valueListenable: obscureNotifier,
              builder: (context, obscure, _) {
                return TextFormField(
                  keyboardType: widget.keyboardType,
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  obscureText: widget.isPassword ? obscure : false,
                  validator: (value) =>
                      widget.validatorFunction?.call(value as T?),
                  style: AppTextStyle.kTitleMediumTextStyle(),
                  decoration: _decoration(obscure),
                  onChanged: (value) {
                    if (widget.onChanged != null) {
                      widget.onChanged!(value as T);
                    }
                  },
                );
              },
            )
          /// DROPDOWN FIELD
          else
            GestureDetector(
              onTap: () {
                if (widget.isSearch) showSearchDropdown();
              },
              child: AbsorbPointer(
                absorbing: widget.isSearch,
                child: ValueListenableBuilder<T?>(
                  valueListenable:
                      widget.valueNotifier ?? ValueNotifier<T?>(null),
                  builder: (context, value, _) {
                    return DropdownButtonFormField<T>(
                      value: widget.selectedValue,
                      isExpanded: true,
                      validator: widget.validatorFunction,
                      hint: Text(
                        widget.dropDownHintText ?? "",
                        style:
                            widget.hintStyle ??
                            AppTextStyle.kTitleMediumTextStyle(
                              fontColor: AppColors.textLightColor,
                            ),
                      ),

                      items: widget.items
                          ?.map(
                            (item) => DropdownMenuItem<T>(
                              value: item,
                              child: Text(
                                item.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.kTitleMediumTextStyle(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        widget.valueNotifier?.value = val;
                        widget.onChanged?.call(val);
                      },
                      decoration: _decoration(false),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  InputDecoration _decoration(bool obscure) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle:
          widget.hintStyle ??
          AppTextStyle.kTitleMediumTextStyle(
            fontColor: AppColors.textLightColor,
          ),
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.isPassword
          ? GestureDetector(
              onTap: () => obscureNotifier.value = !obscureNotifier.value,
              child: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                size: 20.sp,
                color: AppColors.textLightColor,
              ),
            )
          : widget.suffixIcon,
      isDense: true,
      filled: true,
      fillColor: widget.fillColor ?? AppColors.whiteColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: widget.borderColor ?? AppColors.dividerColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: widget.borderColor ?? AppColors.dividerColor,
        ),
      ),
    );
  }
}
