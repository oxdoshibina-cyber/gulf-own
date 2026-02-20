import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/description_card.dart';
import 'package:gulfownsalesview/presentation/screens/completed_works/widget/completed_works_outline_card.dart';
import 'package:gulfownsalesview/presentation/screens/completed_works/widget/data_tile_widget.dart';
import 'package:gulfownsalesview/presentation/screens/completed_works/widget/spare_parts_completed_list.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';

import '../../bloc/completed_work/completed_work_bloc.dart';

class CompletedWorkSecondScreen extends StatefulWidget {
  const CompletedWorkSecondScreen({super.key});

  @override
  State<CompletedWorkSecondScreen> createState() =>
      _CompletedWorkSecondScreenState();
}

class _CompletedWorkSecondScreenState extends State<CompletedWorkSecondScreen> {

  String siQtnNo = "";
  TextEditingController remarksController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final args = Get.arguments;
    if(args is String){
      siQtnNo = args;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: AppBarWidget(
          isArrow: true,
          arrowText: "COMPLETED WORKS",
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: BlocBuilder<CompletedWorkBloc, CompletedWorkState>(
        builder: (context, state) {
          if (state.isDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isDetailsError) {
            return Center(child: Text(state.commonResponseModel!.message));
          }
          if (state.isDetailsSuccess) {
            final ticket = state.completedWorkDetails?.ticket;
            final complaints = state.completedWorkDetails?.complaintList;
            final spares = state.completedWorkDetails?.spareList;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: CompletedWorksOutlineCard(
                      customerName: ticket!.siCustName,
                      mobileNumber: ticket.scrMobileNo,
                      brand: ticket.siCompany,
                      model: ticket.siModel,
                      status: ticket.siFinish,
                      technician: ticket.technician,
                      relocateTech: ticket.relocatedTechnician,
                      cost: ticket.estimateCost,
                    ),
                  ),
                  AppSpacing.h12,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Text(
                      ticket.relocatedReason,
                      style: AppTextStyle.kTitleMediumTextStyle(
                        fontColor: AppColors.redColor,
                      ),
                    ),
                  ),
                  AppSpacing.h10,
                  SizedBox(
                    height: 100.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: complaints!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: DescriptionCard(
                              description: complaints[index].irName,
                              remarks: complaints[index].liRemarks,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  AppSpacing.h10,


                  if(spares!.isNotEmpty)
                  ResponsiveGridLayout(
                    itemCount: spares.length,
                    itemBuilder: (context, index) {
                      final spare = spares[index];
                      return SparePartsCompletedList(
                        sparePartsName: spare.spareName,
                        status: spare.srStatus,
                        qty: spare.qty.toString(),
                        saleRate: spare.srSRate.toStringAsFixed(2),
                        gross: spare.srGross.toStringAsFixed(2),
                        discount: spare.srDiscount.toStringAsFixed(2),
                        net: spare.srNet.toStringAsFixed(2),
                        gst: spare.srGst.toStringAsFixed(2),
                        amount: '₹${spare.srTotal}',

                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 22.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DataTileWidget(
                                text1: "Service Charge",
                                text2: ticket.serviceCharge.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Total Charges",
                                text2: ticket.siTotal.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Other Discount",
                                text2: ticket.siOtherDisc.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Other Charge",
                                text2: ticket.siOtherCharge.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Grand Total",
                                text2: ticket.siGrandTotal.toStringAsFixed(2),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Advn Received",
                                text2: ticket.advanceReceived.toStringAsFixed(2),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Balance",
                                text2: ticket.siBalance.toStringAsFixed(2),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.h16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DataTileWidget(
                                text1: "Cash Received",
                                text2: ticket.siCashReceived.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Accounts",
                                text2: ticket.siCashPaidAcc.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Card Received",
                                text2: ticket.siCardAmount.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              child: DataTileWidget(
                                text1: "Accounts",
                                text2: ticket.siBankAcc.toString(),
                              ),
                            ),
                            AppSpacing.w16,
                            Expanded(
                              flex: 2,
                              child: CustomTextField(isTextField: true, controller: remarksController,),
                            ),

                            AppSpacing.w16,
                            Expanded(
                              child: ContainerButton(
                                radius: BorderRadius.circular(10.r),
                                alignment: Alignment.center,
                                height: 72.h,
                                width: 187.w,
                                onTap: () {
                                  context.read<CompletedWorkBloc>().add(
                                     InsertServiceReturnEvent(
                                        siEntryNo: int.tryParse(siQtnNo)??0,
                                        asId: ticket.siAssignTo,
                                        remarks: remarksController.text.trim()
                                    )
                                  );
                                },
                                text: "Service Return",
                                color: AppColors.redColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
