import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/domain/common/enums/enum.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/add_spare_dialog_box.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/spare_card.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';
import 'package:gulfownsalesview/presentation/widgets/selection_widget.dart';

class CustomerEnquiryAddNewQueryScreen extends StatefulWidget {
  const CustomerEnquiryAddNewQueryScreen({super.key});

  @override
  State<CustomerEnquiryAddNewQueryScreen> createState() =>
      _CustomerEnquiryAddNewQueryScreenState();
}

class _CustomerEnquiryAddNewQueryScreenState
    extends State<CustomerEnquiryAddNewQueryScreen> {
  ValueNotifier<ResponseType> responseNotifier = ValueNotifier(
    ResponseType.active,
  );
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
          arrowText: "ADD NEW ENQUIRY",
          isArrow: true,
          onTap: () {
            Get.back();
          },
          isTrailing: true,
          trailing: FittedBox(
            fit: BoxFit.scaleDown,
            child: ContainerButton(
              color: AppColors.greenColor,
              height: 56.h,
              width: 125.w,
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => AddSpareDialogBox(),
                );
              },
              radius: BorderRadius.circular(10.r),
              alignment: Alignment.center,
              text: "Add Spare",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          fillColor: AppColors.backgroundColor,
                          isTextField: true,
                          label: "Customer Name",
                          hintText: "Enter Customer Name",
                        ),
                      ),
                      AppSpacing.w6,
                      Expanded(
                        child: CustomTextField(
                          fillColor: AppColors.backgroundColor,
                          isTextField: true,
                          label: "Customer Address",
                          hintText: "Enter Customer Address",
                        ),
                      ),
                      AppSpacing.w6,
                      Expanded(
                        child: CustomTextField(
                          fillColor: AppColors.backgroundColor,
                          isTextField: true,
                          label: "Mobile No",
                          hintText: "Enter Mobile No",
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h12,
                  CustomTextField(
                    fillColor: AppColors.backgroundColor,
                    isTextField: true,
                    label: "Customer Findings",
                    hintText: "Enter Customer Findings",
                  ),
                ],
              ),
            ),

            ResponsiveGridLayout(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SpareCard(
                  sparePartsName: 'Spare Parts Name',
                  qty: '8',
                  saleRate: '65.00',
                  gross: '12.00',
                  discount: '5.00',
                  net: '12.00',
                  gst: '5.00',
                  total: '₹877',
                );
              },
            ),

            Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // SelectionWidget(
                      //   reportResponseNotifier: responseNotifier,
                      //   onSelected: (value) => responseNotifier.value = value,
                      //   type: ResponseType.pending,
                      //   selectedColor: AppColors.pendingColor,
                      //   checkColor: AppColors.pendingColor,
                      // ),
                      // AppSpacing.w10,
                      // SelectionWidget(
                      //   reportResponseNotifier: responseNotifier,
                      //   onSelected: (value) => responseNotifier.value = value,
                      //   type: ResponseType.completed,
                      //   selectedColor: AppColors.greenColor,
                      //   checkColor: AppColors.greenColor,
                      // ),
                      // AppSpacing.w10,
                      // SelectionWidget(
                      //   reportResponseNotifier: responseNotifier,
                      //   onSelected: (value) => responseNotifier.value = value,
                      //   type: ResponseType.reject,
                      //   selectedColor: AppColors.redColor,
                      //   checkColor: AppColors.redColor,
                      // ),
                    ],
                  ),
                 // AppSpacing.w100,
                  SizedBox(
                    width: 350.w,
                    child: Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              isTextField: true,
                              borderColor: AppColors.greenColor,
                              hintText: "Estimate Amount",
                            ),
                          ),
                      
                          AppSpacing.w10,
                      
                          Expanded(
                            child: ContainerButton(
                              alignment: Alignment.center,
                              height: 72.h,
                              width: 141.w,
                              onTap: () {},
                              text: "Save",
                              radius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
