import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/widget/customer_enquiry_card.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/date_selection_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';

class CustomerEnquiryScreen extends StatefulWidget {
  const CustomerEnquiryScreen({super.key});

  @override
  State<CustomerEnquiryScreen> createState() => _CustomerEnquiryScreenState();
}

class _CustomerEnquiryScreenState extends State<CustomerEnquiryScreen> {
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
          text: "CUSTOMER ENQUIRY",
          isTrailing: true,
          trailing: FittedBox(
            fit: BoxFit.scaleDown,
            child: ContainerButton(
              height: 56.h,
              width: 200.w,
              onTap: () {
                Get.toNamed(PageRoutes.customerEnquiryAddNewQueryScreen);
              },
              radius: BorderRadius.circular(10.r),
              alignment: Alignment.center,
              text: "Add New Enquiry",
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              child: Row(
                children: [
                  /// 🔹 Date Picker Flexible Width
                  Expanded(child: DateSelectionWidget()),

                  AppSpacing.w12,

                  /// 🔹 Fully Responsive Search CustomTextField
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth:
                            50.w, // allows shrinking instead of fixed width
                      ),
                      child: CustomTextField(
                        isTextField: true,
                        fillColor: AppColors.backgroundColor,
                        hintText: "Search Customer Name, Mob No.",
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppColors.greyColor,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveGridLayout(
              itemCount: 15,
              itemBuilder: (context, index) {
                return CustomerEnquiryCard(
                  onTap: () {
                    Get.toNamed(PageRoutes.customerEnquiryViewScreen);
                  },
                  customerName: 'Customer Name',
                  mobileNumber: '873223222',
                  isMainStatus: false,
                  tokenNumber: '#345',
                  address: 'Perithalmanna,Malappuram\nKerala-679442 ',
                  cost: '₹877',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
