import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

class ShowQualityCheckDialog extends StatefulWidget {
  const ShowQualityCheckDialog({super.key});

  @override
  State<ShowQualityCheckDialog> createState() => _ShowQualityCheckDialogState();
}

class _ShowQualityCheckDialogState extends State<ShowQualityCheckDialog> {
  final ValueNotifier<List<bool>> checklistNotifier = ValueNotifier(
    List.generate(8, (_) => false),
  );

  final TextEditingController findingsController = TextEditingController();

  @override
  void dispose() {
    checklistNotifier.dispose();
    findingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900.w, minWidth: 300.w),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Images Section
                GridView.count(
                  shrinkWrap: true, // ⭐ IMPORTANT
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                  children: List.generate(6, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.grey.shade100,
                      ),
                      child: Icon(
                        Icons.phone_android,
                        size: 60.sp,
                        color: Colors.grey.shade400,
                      ),
                    );
                  }),
                ),

                AppSpacing.h20,

                // Technician Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Technician Name',
                          style: AppTextStyle.kTitleMediumTextStyle(
                            fontColor: AppColors.textLightColor,
                          ),
                        ),
                        Text(
                          "Technician Name",
                          style: AppTextStyle.kButtonTextStyle(
                            fontSize: 20.sp,
                            fontColor: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Emply ID',
                          style: AppTextStyle.kTitleMediumTextStyle(
                            fontColor: AppColors.textLightColor,
                          ),
                        ),
                        Text(
                          'Employee Id',
                          style: AppTextStyle.kButtonTextStyle(
                            fontSize: 20.sp,
                            fontColor: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AppSpacing.h20,

                // Customer Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Name',
                          style: AppTextStyle.kTitleMediumTextStyle(
                            fontColor: AppColors.textLightColor,
                          ),
                        ),
                        Text(
                          'Customer Name',
                          style: AppTextStyle.kButtonTextStyle(
                            fontSize: 20.sp,
                            fontColor: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Model',
                          style: AppTextStyle.kTitleMediumTextStyle(
                            fontColor: AppColors.textLightColor,
                          ),
                        ),
                        Text(
                          'Model',
                          style: AppTextStyle.kButtonTextStyle(
                            fontSize: 20.sp,
                            fontColor: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AppSpacing.h20,
                CustomTextField<String>(
                  isTextField: true,
                  hintText: "Enter Findings",
                  controller: findingsController,
                ),

                AppSpacing.h20,

                // Check Lists Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Check Lists',
                    style: AppTextStyle.kTitleMediumTextStyle(fontSize: 18.sp),
                  ),
                ),
                AppSpacing.h20,

                ValueListenableBuilder<List<bool>>(
                  valueListenable: checklistNotifier,
                  builder: (context, checklistStates, _) {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(8, (index) {
                        final isSelected = checklistStates[index];

                        return GestureDetector(
                          onTap: () {
                            final updated = [...checklistStates];
                            updated[index] = !updated[index];
                            checklistNotifier.value = updated;
                          },
                          child: Container(
                            width: 200.w,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xff003366)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xff003366)
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  size: 16,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'Check Lists',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.kTitleMediumTextStyle(
                                      fontSize: 15.sp,
                                      fontColor: isSelected
                                          ? AppColors.whiteColor
                                          : AppColors.textLightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),

                AppSpacing.h20,

                // Reject and Approve Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ContainerButton(
                        height: 55.h,
                        textStyle: AppTextStyle.kTitleMediumTextStyle(),
                        alignment: Alignment.center,
                        text: "Reject",
                        color: AppColors.whiteColor,
                        radius: BorderRadius.circular(10.r),
                        border: BoxBorder.all(
                          color: AppColors.textLightColor.withOpacity(0.3),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    AppSpacing.w12,
                    Expanded(
                      child: ContainerButton(
                        alignment: Alignment.center,
                        height: 55.h,
                        text: "Approve",
                        color: AppColors.primaryColor,
                        radius: BorderRadius.circular(10.r),
                        textStyle: AppTextStyle.kTitleMediumTextStyle(
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
