import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class SparePartsCompletedList extends StatelessWidget {
  final String sparePartsName;
  final String status;
  final String qty;
  final String saleRate;
  final String gross;
  final String discount;
  final String net;
  final String gst;
  final String amount;
  const SparePartsCompletedList({
    super.key,
    required this.sparePartsName,
    required this.status,
    required this.qty,
    required this.saleRate,
    required this.gross,
    required this.discount,
    required this.net,
    required this.gst,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: BoxBorder.all(color: AppColors.greenColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
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
          AppSpacing.h10,
          Text(
            status,
            style: AppTextStyle.kTitleMediumTextStyle(
              fontColor: AppColors.greenColor,
            ),
          ),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_sectionTitle("Qty"), _sectionTitle("Sale Rate")],
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
            children: [_sectionTitle("Gross"), _sectionTitle("Discount")],
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
            children: [_sectionTitle("Net"), _sectionTitle("GST")],
          ),
          AppSpacing.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_dataTitle(net), _dataTitle(gst)],
          ),
          AppSpacing.h10,
          Divider(color: AppColors.dividerColor),
          AppSpacing.h10,
          Column(
            children: [
              _sectionTitle("Total"),
              Text(
                amount,
                style: AppTextStyle.kLargeTextStyle(
                  fontColor: AppColors.greenColor,
                ),
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
    double size = 18,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        title,
        style: AppTextStyle.kPageHeadingTextStyle(
          fontColor: color,
          fontSize: size.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
