import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_product_details_dialog_box.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_spare_history_pop_up.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_spare_parts_list_pop_up.dart';

class ShowRequestSparePopup extends StatefulWidget {
  const ShowRequestSparePopup({super.key});

  @override
  State<ShowRequestSparePopup> createState() => _ShowRequestSparePopupState();
}

class _ShowRequestSparePopupState extends State<ShowRequestSparePopup> {
  final qtyController = TextEditingController();
  final rateController = TextEditingController();
  final discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: 800.w,
        padding: EdgeInsets.all(22.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: BlocListener<TechDashboardBloc, TechDashboardState>(
          listenWhen: (prev, curr) =>
              prev.isinsertSpareSuccess != curr.isinsertSpareSuccess &&
              curr.isinsertSpareSuccess,
          listener: (context, state) {
            qtyController.clear();
            rateController.clear();
            discountController.clear();
            Navigator.pop(context);
          },
          child: BlocListener<TechDashboardBloc, TechDashboardState>(
            listenWhen: (prev, curr) =>
                prev.showProductDetailsDialog != curr.showProductDetailsDialog,
            listener: (context, state) {
              if (state.showProductDetailsDialog) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const ShowProductDetailsDialogBox(),
                );
              }
            },
            child: BlocListener<TechDashboardBloc, TechDashboardState>(
              listenWhen: (prev, curr) =>
                  prev.selectedProduct != curr.selectedProduct,
              listener: (context, state) {
                qtyController.text = state.qty.toString();
                rateController.text = state.saleRate.toString();
                discountController.text = state.discount.toString();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + CLOSE BTN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Request Spare",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<TechDashboardBloc>().add(
                            const ResetSpareEntryEvent(),
                          );
                          Navigator.pop(context);
                        },

                        child: Icon(
                          Icons.close,
                          size: 22.sp,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h18,

                  /// LABEL
                  Text(
                    "Spare parts",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),

                  AppSpacing.h8,

                  /// DROPDOWN + EYE BUTTON
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.read<TechDashboardBloc>().add(
                              const ResetSpareEntryEvent(),
                            );
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => ShowSparePartsListPopUp(),
                            );
                            context.read<TechDashboardBloc>().add(
                              const SpareListEvent(),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocBuilder<
                                  TechDashboardBloc,
                                  TechDashboardState
                                >(
                                  buildWhen: (prev, curr) =>
                                      prev.selectedSpare != curr.selectedSpare,
                                  builder: (context, state) {
                                    return Text(
                                      state.selectedSpare?.irName ??
                                          "Select Spare",
                                      style: TextStyle(
                                        color: state.selectedSpare == null
                                            ? Colors.grey
                                            : Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  },
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      AppSpacing.w12,

                      /// EYE ICON
                      GestureDetector(
                        onTap: () {
                          final state = context.read<TechDashboardBloc>().state;

                          final productId = state.selectedProduct?.irId;

                          if (productId == null) {
                            log("No product selected yet");
                            return;
                          }
                          context.read<TechDashboardBloc>().add(
                            SparePartHistoryEvent(id: productId),
                          );
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => ShowSpareHistoryPopUp(),
                          );
                        },
                        child: Container(
                          height: 60.h,
                          width: 60.h,
                          decoration: BoxDecoration(
                            color: Color(0xff002660).withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                              SvgRes.eyeIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h20,

                  /// 3 INPUT ROW (QTY, RATE, DISCOUNT)
                  Row(
                    children: [
                      Expanded(
                        child: spareInput(
                          controller: qtyController,
                          label: "Qty",
                          onChanged: (value) {
                            context.read<TechDashboardBloc>().add(
                              UpdateQtyEvent(int.tryParse(value) ?? 0),
                            );
                          },
                        ),
                      ),

                      AppSpacing.w12,
                      Expanded(
                        child: spareInput(
                          controller: rateController,
                          label: "S Rate",
                          onChanged: (value) {
                            context.read<TechDashboardBloc>().add(
                              UpdateRateEvent(double.tryParse(value) ?? 0),
                            );
                          },
                        ),
                      ),

                      AppSpacing.w12,
                      Expanded(
                        child: spareInput(
                          controller: discountController,
                          label: "Discount",
                          onChanged: (value) {
                            context.read<TechDashboardBloc>().add(
                              UpdateDiscountEvent(double.tryParse(value) ?? 0),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h18,

                  /// DATA SUMMARY ROW
                  BlocBuilder<TechDashboardBloc, TechDashboardState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: 24.w,
                              runSpacing: 12.h,
                              children: [
                                summaryCol("Qty", state.qty.toString()),
                                summaryCol(
                                  "Sale Rate",
                                  state.saleRate.toStringAsFixed(2),
                                ),
                                summaryCol(
                                  "Gross",
                                  state.gross.toStringAsFixed(2),
                                ),
                                summaryCol("Net", state.net.toStringAsFixed(2)),
                                summaryCol("GST", state.gst.toStringAsFixed(2)),
                                summaryCol(
                                  "Total",
                                  state.total.toStringAsFixed(2),
                                  green: true,
                                ),
                              ],
                            ),
                          ),

                          AppSpacing.w16,

                          ElevatedButton(
                            onPressed: () {
                              final state = context
                                  .read<TechDashboardBloc>()
                                  .state;

                              final ticketId = state
                                  .technicianDashboardResModel
                                  .ticket
                                  ?.entryNo;
                              final itemId = state.selectedSpare?.irId;
                              final double uniqueCode =
                                  state.insertSpareResModel.isNotEmpty
                                  ? state.insertSpareResModel.last.uniqueCode
                                  : 0;

                              if (ticketId == null || itemId == null) {
                                log("❌ Ticket ID or Item ID missing");
                                return;
                              }
                              final model = InsertSpareReqModel(
                                srId: 0,
                                srTicketNo: ticketId,
                                srItemId: itemId,
                                srQty: state.qty,
                                srSRate: rateController.text.isEmpty
                                    ? 0
                                    : double.parse(rateController.text),
                                srDiscount: discountController.text.isEmpty
                                    ? 0
                                    : double.parse(discountController.text),
                                srsGross: state.gross,
                                srsNet: state.net,
                                srsGst: state.gst,
                                srsTotal: state.total,
                                createdBy: 0,
                                uniqueCode: uniqueCode,
                              );
                              context.read<TechDashboardBloc>().add(
                                InsertSpareEvent(insertSpareReqModel: model),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 28.w,
                                vertical: 14.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  AppSpacing.h20,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget spareInput({
    required String label,
    required ValueChanged<String> onChanged,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.number,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        AppSpacing.h8,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: "Enter",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget summaryCol(String label, String value, {bool green = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        AppSpacing.h4,
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: green ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}
