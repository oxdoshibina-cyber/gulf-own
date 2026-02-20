import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/data_column_widget.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/spare_parts_history_dialog_box.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';

class AddSpareDialogBox extends StatefulWidget {
  const AddSpareDialogBox({super.key});

  @override
  State<AddSpareDialogBox> createState() => _AddSpareDialogBoxState();
}

class _AddSpareDialogBoxState extends State<AddSpareDialogBox> {
  final ValueNotifier<String?> selectedSpareNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      // reduce inset a bit if you want more screen usage
      insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use most of the screen width, but cap it so it doesn’t become too huge
          final double dialogWidth = 0.75.sw; // 90% of screen width

          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: dialogWidth, // much wider than 400.w
              minWidth: 300.w,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ---------- Header Row ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Request Spare",
                        style: AppTextStyle.kLargeTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          fontColor: AppColors.darkColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          size: 18.sp,
                          color: AppColors.textLightColor,
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h8,

                  /// ---------- Spare Parts Dropdown ----------
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // ⬅️ aligns bottom edges
                    children: [
                      Expanded(
                        child: CustomTextField(
                          isTextField: false,
                          isSearch: true,
                          label: "Spare parts",
                          hintText: "Select Spare",
                          dropDownText: "Spare Parts List",
                          dropDownHintText: "Search Spare Parts",
                          items: const [
                            "Spare Parts 1",
                            "Spare Parts 2",
                            "Spare Parts 3",
                            "Spare Parts 4",
                            "Spare Parts 5",
                            "Spare Parts 6",
                            "Spare Parts 7",
                            "Spare Parts 8",
                          ],
                          valueNotifier: selectedSpareNotifier,
                        ),
                      ),

                      AppSpacing.w10,

                      SizedBox(
                        height: 65.h, // ⬅️ stays fixed
                        width: 65.w,
                        child: Align(
                          alignment: Alignment
                              .bottomCenter, // ⬅️ perfect bottom alignment
                          child: ContainerButton(
                            radius: BorderRadius.circular(10.r),
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => SparePartsHistoryDialogBox(),
                              );
                            },
                            color: AppColors.backgroundColor,
                            isWidget: true,
                            isChild: Center(
                              child: ResponsiveSvgIcon(
                                asset: SvgRes.eyeIcon,
                                size: 21.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h16,

                  /// ---------- Row of Qty / S Rate / Discount ----------
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          isTextField: true,
                          label: "Qty",
                          hintText: "Enter Qty",
                        ),
                      ),
                      AppSpacing.w10,
                      Expanded(
                        child: CustomTextField(
                          isTextField: true,
                          label: "S Rate",
                          hintText: "Enter S Rate",
                        ),
                      ),
                      AppSpacing.w10,
                      Expanded(
                        child: CustomTextField(
                          isTextField: true,
                          label: "Discount",
                          hintText: "Enter Discount",
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              DataColumnWidget(text1: "Qty", text2: "0.00"),
                              AppSpacing.w12,
                              DataColumnWidget(
                                text1: "Sale Rate",
                                text2: "0.00",
                              ),
                              AppSpacing.w12,
                              DataColumnWidget(text1: "Gross", text2: "0.00"),
                              AppSpacing.w12,
                              DataColumnWidget(text1: "Net", text2: "0.00"),
                              AppSpacing.w12,
                              DataColumnWidget(text1: "GST", text2: "0.00"),
                              AppSpacing.w12,
                              DataColumnWidget(
                                text1: "Total",
                                text2: "0.00",
                                color: AppColors.greenColor,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Add Button
                      Row(
                        children: [
                          ContainerButton(
                            radius: BorderRadius.circular(8.r),
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 110.w,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            color: AppColors.greenColor,
                            text: "Add",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
