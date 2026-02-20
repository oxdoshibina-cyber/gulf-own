import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

import '../../../bloc/spare_allocation/spare_allocation_bloc.dart';

class SpareDataDialogBox extends StatefulWidget {
  final int spareId;
  // final String technicianName;
  // final String deliveryDate;
  // final String customerName;
  final String status;
  // final String brand;
  // final String model;
  // final String qty;
  // final String total;
  // final String sparePartsName;
  // final String spareQty;
  // final String salesRate;

  const SpareDataDialogBox({
    super.key,
    required this.spareId,
    // required this.technicianName,
    // required this.deliveryDate,
    // required this.customerName,
    required this.status,
    // required this.brand,
    // required this.model,
    // required this.qty,
    // required this.total,
    // required this.sparePartsName,
    // required this.spareQty,
    // required this.salesRate,
  });

  @override
  State<SpareDataDialogBox> createState() => _SpareDataDialogBoxState();
}

class _SpareDataDialogBoxState extends State<SpareDataDialogBox> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SpareAllocationBloc>().add(GetSpareDetailedEvent(widget.spareId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpareAllocationBloc, SpareAllocationState>(
  builder: (context, state) {
    final ticket = state.spareDetails.ticket;
    final spareList = state.spareDetails.spareList;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return ConstrainedBox(
            constraints: BoxConstraints(
              /// 🔥 Updated responsive width rule
              maxWidth: maxWidth > 900.w ? 650.w : 0.9.sw,
              minWidth: 350.w,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionTitle("Technician Name"),
                        _sectionTitle("Delivery Date"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _dataTitle(ticket.technician),
                        _dataTitle(ticket.siDeliveryDate),
                      ],
                    ),

                    AppSpacing.h14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionTitle("Customer Name"),
                        _sectionTitle("Status"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _dataTitle(ticket.siCustName),
                        _dataTitle(
                          widget.status,
                          color: widget.status == "Approved"
                              ? AppColors.greenColor
                              : widget.status == "Pending"
                              ? AppColors.redColor
                              : AppColors.darkColor,
                        ),
                      ],
                    ),
                    AppSpacing.h14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionTitle("Brand"),
                        _sectionTitle("Model"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [_dataTitle(ticket.siCompany), _dataTitle(ticket.siModel)],
                    ),
                    AppSpacing.h14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [_sectionTitle("Qty"), _sectionTitle("Total")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _dataTitle('5'),
                        _dataTitle('250', color: AppColors.greenColor),
                      ],
                    ),
                    AppSpacing.h14,
                    ListView.separated(
                      itemCount: 5, // make dynamic later
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => AppSpacing.h14,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.dividerColor),
                            color: AppColors.whiteColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                spareList[index]!.irName,
                                style: AppTextStyle.kPageHeadingTextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontColor: AppColors.primaryColor,
                                ),
                              ),
                              AppSpacing.h6,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _sectionTitle("Qty"),
                                  _sectionTitle("Sale Rate"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _dataTitle(spareList[index]!.srQty.toString(), size: 16.sp),
                                  _dataTitle(spareList[index]!.srSrate.toString(), size: 16.sp),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    AppSpacing.h40,

                    /// Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ContainerButton(
                            alignment: Alignment.center,
                            height: 55.h,
                            radius: BorderRadius.circular(10.r),
                            onTap: () => Navigator.pop(context),
                            text: "Reject",
                            textStyle: AppTextStyle.kTitleMediumTextStyle(
                              fontColor: AppColors.redColor,
                            ),
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
                            },
                            text: "Approve",
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
            ),
          );
        },
      ),
    );
  },
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
