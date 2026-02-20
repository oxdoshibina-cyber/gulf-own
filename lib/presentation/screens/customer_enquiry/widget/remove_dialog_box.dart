import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

class RemoveDialogBox extends StatelessWidget {
  final String sparePartsName;
  final String amount;

  const RemoveDialogBox({
    super.key,
    required this.sparePartsName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
           constraints: BoxConstraints(maxWidth: 580.w, minWidth: 280.w),
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
                  Text(
                    sparePartsName,
                    style: AppTextStyle.kLargeTextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.primaryColor,
                    ),
                  ),
                  AppSpacing.h10,
                  Text(
                    amount,
                    style: AppTextStyle.kLargeTextStyle(
                      fontColor: AppColors.greenColor,
                    ),
                  ),
                  AppSpacing.h10,
                  CustomTextField(isTextField: true, hintText: "Reject reason"),
                  AppSpacing.h32,

                  /// Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ContainerButton(
                          alignment: Alignment.center,
                          height: 55.h,
                          radius: BorderRadius.circular(10.r),
                          onTap: () => Navigator.pop(context),
                          text: "Cancel",
                          textStyle: AppTextStyle.kTitleMediumTextStyle(),
                          color: AppColors.whiteColor,
                          border: BoxBorder.all(
                            color: AppColors.textLightColor.withOpacity(0.3),
                          ),
                        ),
                      ),
                      AppSpacing.w14,
                      Expanded(
                        child: ContainerButton(
                          alignment: Alignment.center,
                          height: 55.h,
                          radius: BorderRadius.circular(10.r),
                          onTap: () {
                            Navigator.pop(context);
                            // Get.offAllNamed(PageRoutes.mainPage);
                          },
                          text: "Confirm",
                          textStyle: AppTextStyle.kTitleMediumTextStyle(
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.whiteColor,
                          ),
                          color: AppColors.primaryColor,
                        ),
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
