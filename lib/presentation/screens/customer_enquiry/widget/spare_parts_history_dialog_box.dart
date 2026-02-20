import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/spare_parts_history_card.dart';

class SparePartsHistoryDialogBox extends StatelessWidget {
  const SparePartsHistoryDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      // reduce inset a bit if you want more screen usage
      insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use most of the screen width, but cap it so it doesn’t become too huge
          final double dialogWidth = 0.55.sw; // 90% of screen width

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spare Parts History",
                        style: AppTextStyle.kTitleMediumTextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
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
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SparePartsHistoryCard(
                          spareName: "Spare Parts Name",
                          customerName: "Customer Name",
                          date: "27/10/25",
                          cost: "454.00",
                        );
                      },
                      separatorBuilder: (context, index) => AppSpacing.h14,
                      itemCount: 7,
                    ),
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
