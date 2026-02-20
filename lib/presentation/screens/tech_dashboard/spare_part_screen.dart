// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gulfownsalesview/domain/common/enums/enum.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/description_card.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/customer_detail_card.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/reject_dialog_box.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_hold_dialog.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_relocate_popup.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_request_spare_popup.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/spare_card_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/selection_widget.dart';
import 'package:gulfownsalesview/util/response_type_mapper.dart';
import '../../../core/assets/asset_resources.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/responsive_grid_layout.dart';
import '../../widgets/responsive_svg_icon.dart';

class SparePartsPage extends StatefulWidget {
  const SparePartsPage({super.key});

  @override
  State<SparePartsPage> createState() => _SparePartsPageState();
}

class _SparePartsPageState extends State<SparePartsPage> {
  int? ticketId;
  late final ValueNotifier<ResponseType> _statusNotifier;

  @override
  void initState() {
    super.initState();

    final bloc = context.read<TechDashboardBloc>();
    final ticket = bloc.state.technicianDashboardResModel.ticket;

    _statusNotifier = ValueNotifier<ResponseType>(
      responseTypeFromApi(ticket?.otherRemarks),
    );

    final args = Get.arguments;
    if (args is int) {
      ticketId = args;
      bloc.add(TechnicianDashboardEvent(id: ticketId!));
    }
  }

  @override
  void dispose() {
    _statusNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TechDashboardBloc, TechDashboardState>(
      listenWhen: (p, c) =>
          p.technicianDashboardResModel.ticket?.otherRemarks !=
          c.technicianDashboardResModel.ticket?.otherRemarks,
      listener: (context, state) {
        final status = responseTypeFromApi(
          state.technicianDashboardResModel.ticket?.otherRemarks,
        );
        _statusNotifier.value = status;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          title: AppBarWidget(
            text: "TECHNICIAN ASSIGN TICKETS",
            isTrailing: true,
            isRow: true,
            subtitleWidget: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      ResponsiveSvgIcon(
                        asset: SvgRes.backIcon,
                        color: AppColors.textLightColor,
                        size: 30.sp,
                      ),
                      AppSpacing.w16,
                      Text(
                        "TECHNICIAN DASHBOARD",
                        style: AppTextStyle.kLargeTextStyle(
                          fontColor: AppColors.textLightColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.w36,
                ResponsiveSvgIcon(asset: SvgRes.backIcon, size: 30.sp),
                AppSpacing.w16,
                Text("SPARE PARTS", style: AppTextStyle.kLargeTextStyle()),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 20.sp,
                        color: Colors.redAccent,
                      ),
                      AppSpacing.w4,
                      BlocBuilder<TechDashboardBloc, TechDashboardState>(
                        builder: (context, state) {
                          final int hours = state.elapsedSeconds ~/ 3600;
                          final int minutes =
                              (state.elapsedSeconds % 3600) ~/ 60;
                          final int seconds = state.elapsedSeconds % 60;

                          return Text(
                            "${hours.toString().padLeft(2, '0')}:"
                            "${minutes.toString().padLeft(2, '0')}:"
                            "${seconds.toString().padLeft(2, '0')}",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                AppSpacing.w16,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 20.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ), // 🔥 smaller curve
                    ),
                  ),
                  onPressed: () {
                    context.read<TechDashboardBloc>().add(
                      const ResetSpareEntryEvent(),
                    );
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => ShowRequestSparePopup(),
                    );
                  },
                  child: Text(
                    "Request Spare",
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                ),

                AppSpacing.w36,
              ],
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<TechDashboardBloc, TechDashboardState>(
            builder: (context, state) {
              if (state.istechnicianDashboardLoading &&
                  state.technicianDashboardResModel.spareList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              final model = state.technicianDashboardResModel;
              final double grandTotal = model.spareList.fold(
                0.0,
                (sum, item) =>
                    sum + (double.tryParse(item.total.toString()) ?? 0.0),
              );
              return SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomerDetailCard(
                        customerName: model.ticket?.customerName ?? "",
                        mobileNumber: model.ticket?.mobileNumber ?? "",
                        brand: model.ticket?.company ?? "",
                        model: model.ticket?.model ?? "",
                        status: model.ticket?.finish ?? "",
                        technician: model.ticket?.technician ?? "",
                        relocateTechnician:
                            model.ticket?.relocatedTechnician ?? "",
                        cost: model.ticket?.estimateCost ?? "",
                      ),
                    ),

                    AppSpacing.h20,

                    /// REASON TEXT
                    Text(
                      model.ticket?.relocatedReason ?? "",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.redAccent,
                      ),
                    ),

                    AppSpacing.h20,
                    if (model.complaints.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          height: 100.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: model.complaints.length,
                            separatorBuilder: (_, __) => AppSpacing.w12,
                            itemBuilder: (context, index) {
                              final complaint = model.complaints[index];
                              return DescriptionCard(
                                description: complaint.itemName,
                                remarks: complaint.remarks,
                                isDeleteIcon: false,
                              );
                            },
                          ),
                        ),
                      ),

                    AppSpacing.h25,

                    /// SPARE PART CARDS
                    BlocBuilder<TechDashboardBloc, TechDashboardState>(
                      buildWhen: (p, c) =>
                          p.technicianDashboardResModel.spareList.length !=
                          c.technicianDashboardResModel.spareList.length,
                      builder: (context, state) {
                        final list =
                            state.technicianDashboardResModel.spareList;

                        if (list.isEmpty) return const SizedBox();

                        return ResponsiveGridLayout(
                          itemCount: list.length, // ✅ FIXED
                          itemBuilder: (context, index) {
                            final spare = list[index]; // ✅ FIXED
                            final isApproved =
                                spare.status.toLowerCase() == 'approved';

                            return SpareCardWidget(
                              sparePartsName: spare.name,
                              status: spare.status,
                              quantity: spare.quantity.toString(),
                              saleRate: spare.rate.toString(),
                              gross: spare.gross.toString(),
                              discount: spare.discount.toString(),
                              net: spare.net.toString(),
                              gst: spare.gst.toString(),
                              total: spare.total.toString(),
                              isApproved: isApproved,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => RejectDialogBox(),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            "Grand Total : ₹ ${grandTotal.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greenColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    AppSpacing.h25,
                  ],
                ),
              );
            },
          ),
        ),

        /// FOOTER PART
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            children: [
              BlocBuilder<TechDashboardBloc, TechDashboardState>(
                builder: (context, state) {
                  return SelectionWidget<ResponseType>(
                    selectedNotifier: _statusNotifier,
                    value: ResponseType.inProgress,
                    selectedColor: AppColors.inProgressColor,
                    onSelected: (value) {
                      _statusNotifier.value = value;
                      context.read<TechDashboardBloc>().add(
                        const StartTimerEvent(),
                      );

                      context.read<TechDashboardBloc>().add(
                        UpdateTechnicianEvent(ResponseType.inProgress),
                      );
                    },
                    labelBuilder: (v) => v.title,
                  );
                },
              ),

              AppSpacing.w10,
              BlocBuilder<TechDashboardBloc, TechDashboardState>(
                builder: (context, state) {
                  return SelectionWidget<ResponseType>(
                    checkColor: AppColors.greenColor,
                    selectedColor: AppColors.greenColor,
                    selectedNotifier: _statusNotifier,
                    value: ResponseType.completed,
                    onSelected: (value) {
                      _statusNotifier.value = value;
                      context.read<TechDashboardBloc>().add(
                        const StopTimerEvent(),
                      );
                    },
                    labelBuilder: (value) => value.title,
                  );
                },
              ),
              AppSpacing.w10,
              BlocBuilder<TechDashboardBloc, TechDashboardState>(
                builder: (context, state) {
                  return SelectionWidget<ResponseType>(
                    selectedNotifier: _statusNotifier,
                    value: ResponseType.hold,
                    selectedColor: AppColors.pendingColor,
                    checkColor: AppColors.pendingColor,
                    onSelected: (_) async {
                      final reason = await showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const ShowHoldDialog(),
                      );

                      if (!mounted || reason == null) return;

                      _statusNotifier.value = ResponseType.hold;
                      context.read<TechDashboardBloc>().add(
                        const StopTimerEvent(),
                      );

                      context.read<TechDashboardBloc>().add(
                        UpdateTechnicianEvent(
                          ResponseType.hold,
                          remarks: reason,
                        ),
                      );
                    },
                    labelBuilder: (v) => v.title,
                  );
                },
              ),

              AppSpacing.w10,
              BlocBuilder<TechDashboardBloc, TechDashboardState>(
                builder: (context, state) {
                  return SelectionWidget<ResponseType>(
                    selectedNotifier: _statusNotifier,
                    value: ResponseType.dead,
                    selectedColor: AppColors.redColor,
                    checkColor: AppColors.redColor,
                    onSelected: (value) {
                      _statusNotifier.value = value;
                      context.read<TechDashboardBloc>().add(
                        const StopTimerEvent(),
                      );
                      context.read<TechDashboardBloc>().add(
                        UpdateTechnicianEvent(ResponseType.dead),
                      );
                    },
                    labelBuilder: (v) => v.title,
                  );
                },
              ),

              AppSpacing.w16,

              /// TEXT FIELD
              Expanded(
                child: SizedBox(
                  height: 46.h,

                  child: TextField(
                    style: TextStyle(
                      // ✅ ADD THIS
                      fontSize: 14.sp, // or 15.sp
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Narration",
                      hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.h,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),

              AppSpacing.w16,

              /// RELOCATE BUTTON
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const ShowRelocatePopup(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  side: const BorderSide(color: Color(0xff002866)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 12.h,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "Relocate",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Color(0xff002866),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSpacing.w6,
                    Icon(Icons.refresh, color: Color(0xff002866), size: 18.sp),
                  ],
                ),
              ),

              AppSpacing.w14,

              ValueListenableBuilder<ResponseType>(
                valueListenable: _statusNotifier,
                builder: (context, status, _) {
                  final isCompleted = status == ResponseType.completed;

                  return BlocBuilder<TechDashboardBloc, TechDashboardState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: isCompleted
                            ? () {
                                final spareList =
                                    state.technicianDashboardResModel.spareList;

                                // ❌ 1. NO SPARES
                                if (spareList.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Please add at least one spare part before submitting",
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                  return;
                                }

                                // ❌ 2. UNAPPROVED SPARES
                                final hasUnapprovedSpare = spareList.any(
                                  (spare) =>
                                      spare.status.toLowerCase() != 'approved',
                                );

                                if (hasUnapprovedSpare) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Please approve all spare parts before submitting",
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                  return;
                                }

                               

                                // ✅ FINAL SUBMIT
                                context.read<TechDashboardBloc>().add(
                                  UpdateTechnicianEvent(ResponseType.completed),
                                );

                                Get.offAllNamed(
                                  PageRoutes.mainPage,
                                  arguments: 3,
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isCompleted
                              ? const Color(0xff002866)
                              : Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.w,
                            vertical: 14.h,
                          ),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
