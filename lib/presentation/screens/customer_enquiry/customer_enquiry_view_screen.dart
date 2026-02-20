import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/common/enums/enum.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/add_spare_dialog_box.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/spare_card.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';
import 'package:gulfownsalesview/presentation/widgets/selection_widget.dart';

class CustomerEnquiryViewScreen extends StatefulWidget {
  const CustomerEnquiryViewScreen({super.key});

  @override
  State<CustomerEnquiryViewScreen> createState() =>
      _CustomerEnquiryViewScreenState();
}

class _CustomerEnquiryViewScreenState extends State<CustomerEnquiryViewScreen> {
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
          arrowText: "VIEW ENQUIRY",
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
                  Row(
                    children: [
                      ContainerButton(
                        alignment: Alignment.center,
                        radius: BorderRadius.circular(10.r),
                        onTap: () => Navigator.pop(context),
                        isWidget: true,
                        isChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _sectionTitle('Estimate Amount'),
                              _dataTitle("1754"),
                            ],
                          ),
                        ),
                        textStyle: AppTextStyle.kTitleMediumTextStyle(),
                        color: AppColors.whiteColor,
                        border: BoxBorder.all(color: AppColors.greenColor),
                      ),
                      AppSpacing.w10,
                      ContainerButton(
                        alignment: Alignment.center,
                        height: 72.h,
                        width: 166.w,
                        onTap: () {},
                        color: AppColors.redColor,
                        text: "Reject",
                        radius: BorderRadius.circular(10.r),
                      ),
                      AppSpacing.w10,
                      ContainerButton(
                        alignment: Alignment.center,
                        height: 72.h,
                        width: 166.w,
                        onTap: () {},
                        text: "Convert",
                        radius: BorderRadius.circular(10.r),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget _dataTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        title,
        style: AppTextStyle.kPageHeadingTextStyle(
          fontColor: AppColors.greenColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
