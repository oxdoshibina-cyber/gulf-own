import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

import '../../../../domain/register_complaint/model/insert_service_complaint_req_model.dart';
import '../../../bloc/register_complaint/register_complaint_bloc.dart';
import '../../../router/page_routes.dart';

class AddCustomerDialogBox extends StatefulWidget {
  const AddCustomerDialogBox({super.key});

  @override
  State<AddCustomerDialogBox> createState() => _AddCustomerDialogBoxState();
}

class _AddCustomerDialogBoxState extends State<AddCustomerDialogBox> {

  /// Controllers
  final TextEditingController customerNameCtrl = TextEditingController();
  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController contactCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController findingsCtrl = TextEditingController();

  @override
  void dispose() {
    customerNameCtrl.dispose();
    mobileCtrl.dispose();
    emailCtrl.dispose();
    contactCtrl.dispose();
    addressCtrl.dispose();
    findingsCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      backgroundColor: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 900.w,
              minWidth: 300.w,
            ),
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      "Add Customer",
                      style: AppTextStyle.kTitleMediumTextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSpacing.h14,

                    /// Customer Name
                    CustomTextField(
                      controller: customerNameCtrl,
                      isTextField: true,
                      label: "Customer Name",
                      hintText: "Enter Customer Name",
                    ),

                    AppSpacing.h14,

                    /// Row (Always Row - Not changing to Column)
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: mobileCtrl,
                            isTextField: true,
                            label: "Mobile No",
                            hintText: "Enter Mobile No",
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomTextField(
                            controller: emailCtrl,
                            isTextField: true,
                            label: "Email Address",
                            hintText: "Enter Email Address",
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomTextField(
                            keyboardType: TextInputType.phone,
                            controller: contactCtrl,
                            isTextField: true,
                            label: "Contact No",
                            hintText: "Enter Contact No",
                          ),
                        ),
                      ],
                    ),

                    AppSpacing.h14,

                    /// Address
                    CustomTextField(
                      controller: addressCtrl,
                      isTextField: true,
                      label: "Customer Address",
                      hintText: "Enter Customer Address",
                    ),

                    AppSpacing.h14,

                    /// Findings
                    CustomTextField(
                      controller: findingsCtrl,
                      isTextField: true,
                      label: "Customer Findings",
                      hintText: "Enter Customer Findings",
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
                            text: "Cancel",
                            textStyle: AppTextStyle.kTitleMediumTextStyle(),
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
                            onTap: () async {
                              final model = InsertServiceComplaintReqModel(
                                scrId: 0,
                                scrCustomerName:
                                customerNameCtrl.text.trim(),
                                scrMobileNo: mobileCtrl.text.trim(),
                                scrEmail: emailCtrl.text.trim(),
                                scrContactNo: contactCtrl.text.trim(),
                                scrCategoryId: -1,
                                scrCustomerAddress: addressCtrl.text.trim(),
                                scrFindings: findingsCtrl.text.trim(),
                                srcIsLedger: true,
                                srcLedgerId: 0,
                                userId: 0,
                              );

                              context.read<RegisterComplaintBloc>().add(
                                InsertServiceComplaintEvent(
                                  insertServiceComplaintReqModel: model,
                                ),
                              );

                              context.read<RegisterComplaintBloc>().add(
                                const GetAllCustomersEvent(),
                              );

                              Navigator.pop(context);
                              Get.offAllNamed(PageRoutes.mainPage, arguments: 7);
                            },
                            text: "Save",
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
  }
}
