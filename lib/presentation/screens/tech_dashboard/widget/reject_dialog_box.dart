import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

class RejectDialogBox extends StatefulWidget {
  const RejectDialogBox({super.key});

  @override
  State<RejectDialogBox> createState() => _RejectDialogBoxState();
}

class _RejectDialogBoxState extends State<RejectDialogBox> {
  final TextEditingController reasonController = TextEditingController();

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600.w, minWidth: 280.w),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  "Spare Parts Name",
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryColor,
                  ),
                ),
                AppSpacing.h6,
                Text(
                  "Approved",
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.greenColor,
                  ),
                ),
                AppSpacing.h10,

                /// Mobile field
                CustomTextField(
                  controller: reasonController,
                  isTextField: true,
                  keyboardType: TextInputType.phone,
                  hintText: "Reject reason",
                  borderColor: AppColors.greyColor,
                ),

                AppSpacing.h20,

                /// Buttons
                Row(
                  children: [
                    Expanded(
                      child: ContainerButton(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5.r,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        textStyle: AppTextStyle.kTitleMediumTextStyle(),
                        height: 55.h,
                        radius: BorderRadius.circular(10.r),
                        alignment: Alignment.center,
                        text: "Cancel",
                        color: AppColors.whiteColor,
                        border: BoxBorder.all(
                          color: AppColors.textLightColor.withOpacity(0.3),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    AppSpacing.w14,

                    Expanded(
                      child: ContainerButton(
                        height: 55.h,
                        radius: BorderRadius.circular(10.r),
                        alignment: Alignment.center,
                        text: "Confirm",
                        color: AppColors.primaryColor,
                        textStyle: AppTextStyle.kTitleMediumTextStyle(
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          // final reason = reasonController.text.trim();

                          // if (reason.isEmpty) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       content: Text("Enter valid mobile number"),
                          //     ),
                          //   );
                          //   return;
                          // }

                          // context.read<RegisterComplaintBloc>().add(
                          //   RegisterComplaintByMobileEvent(mobileNo: mobile),
                          // );
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
