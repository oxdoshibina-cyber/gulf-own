import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/remove_dialog_box.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class SpareCard extends StatelessWidget {
  final String sparePartsName;
  final String qty;
  final String saleRate;
  final String gross;
  final String discount;
  final String net;
  final String gst;
  final String total;

  const SpareCard({
    super.key,
    required this.sparePartsName,
    required this.qty,
    required this.saleRate,
    required this.gross,
    required this.discount,
    required this.net,
    required this.gst,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
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
          AppSpacing.h14,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_sectionTitle("Qty"), _sectionTitle('Sale Rate')],
          ),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dataTitle(qty),
              _dataTitle(saleRate, color: AppColors.greenColor),
            ],
          ),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_sectionTitle("Gross"), _sectionTitle('Discount')],
          ),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dataTitle(gross),
              _dataTitle(discount, color: AppColors.redColor),
            ],
          ),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_sectionTitle("Net"), _sectionTitle('GST')],
          ),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_dataTitle(net), _dataTitle(gst)],
          ),
          AppSpacing.h10,
          Divider(color: AppColors.dividerColor),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Total"),
                  _dataTitle(
                    total,
                    color: AppColors.greenColor,
                    size: 24.sp,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              AppSpacing.h10,
              ContainerButton(
                alignment: Alignment.center,
                height: 40.h,
                width: 100.w,
                radius: BorderRadius.circular(8.r),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => RemoveDialogBox(
                      sparePartsName: 'Spare Parts Name',
                      amount: '₹877',
                    ),
                  );
                },
                color: AppColors.redColor,
                text: "Remove",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        title,
        style: AppTextStyle.kPageHeadingTextStyle(
          fontColor: AppColors.textLightColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget _dataTitle(
    String title, {
    Color color = AppColors.darkColor,
    double size = 16,
    FontWeight weight = FontWeight.w600,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        title,
        style: AppTextStyle.kPageHeadingTextStyle(
          fontColor: color,
          fontSize: size.sp,
          fontWeight: weight,
        ),
      ),
    );
  }
}
