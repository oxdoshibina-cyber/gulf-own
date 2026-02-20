import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_complaint.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/insert_service_complaint_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/widgets/searchable_drop_down.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

class RegisterComplaintDialog extends StatefulWidget {
  final List<GetServiceComplaint> serviceComplaints;
  final String initialMobile;

  const RegisterComplaintDialog({
    super.key,
    required this.serviceComplaints,
    required this.initialMobile,
  });

  @override
  State<RegisterComplaintDialog> createState() =>
      _RegisterComplaintDialogState();
}

class _RegisterComplaintDialogState extends State<RegisterComplaintDialog> {
  final ValueNotifier<GetServiceCategory?> selectedCategoryNotifier =
      ValueNotifier(null);

  /// Controllers
  final TextEditingController customerNameCtrl = TextEditingController();
  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController contactCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController findingsCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// Fetch categories
    context.read<RegisterComplaintBloc>().add(
          const GetServiceCategoryEvent(),
        );

    /// CASE 1: Complaint exists → prefill from API
    if (widget.serviceComplaints.isNotEmpty) {
      final data = widget.serviceComplaints.first;

      customerNameCtrl.text = data.scrCustomerName;
      mobileCtrl.text = data.scrMobileNo;
      emailCtrl.text = data.scrEmail;
      contactCtrl.text = data.scrContactNo;
      addressCtrl.text = data.scrCustomerAddress;
      findingsCtrl.text = data.scrFindings;
    }
    /// CASE 2: No complaint → prefill from search mobile
    else {
      mobileCtrl.text = widget.initialMobile;
    }
  }

  @override
  void dispose() {
    customerNameCtrl.dispose();
    mobileCtrl.dispose();
    emailCtrl.dispose();
    contactCtrl.dispose();
    addressCtrl.dispose();
    findingsCtrl.dispose();
    selectedCategoryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterComplaintBloc, RegisterComplaintState>(
      listenWhen: (previous, current) =>
          previous.serviceCategories != current.serviceCategories &&
          current.serviceCategories.isNotEmpty,
      listener: (context, state) {
        /// Prefill category AFTER categories load
        if (widget.serviceComplaints.isNotEmpty &&
            selectedCategoryNotifier.value == null) {
          final complaint = widget.serviceComplaints.first;

          final matchedCategory = state.serviceCategories.firstWhere(
            (e) => e.cId == complaint.scrCategoryId,
            orElse: () => state.serviceCategories.first,
          );

          selectedCategoryNotifier.value = matchedCategory;
        }
      },
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900.w, minWidth: 300.w),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                Text(
                  "Register Complaint",
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                AppSpacing.h14,

                CustomTextField(
                  controller: customerNameCtrl,
                  isTextField: true,
                  label: "Customer Name",
                  hintText: "Enter Customer Name",
                ),

                AppSpacing.h14,

                /// MOBILE + EMAIL
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
                    AppSpacing.w14,
                    Expanded(
                      child: CustomTextField(
                        controller: emailCtrl,
                        isTextField: true,
                        label: "Email Address",
                        hintText: "Enter Email Address",
                      ),
                    ),
                  ],
                ),

                AppSpacing.h14,

                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        keyboardType: TextInputType.phone,
                        controller: contactCtrl,
                        isTextField: true,
                        label: "Contact No",
                        hintText: "Enter Contact number",
                      ),
                    ),
                    AppSpacing.w14,
                    Expanded(
                      child: BlocBuilder<RegisterComplaintBloc,
                          RegisterComplaintState>(
                        buildWhen: (p, c) =>
                            p.serviceCategories != c.serviceCategories,
                        builder: (context, state) {
                          return SearchableDropdown<GetServiceCategory>(
                            label: "Category",
                            hintText: "Choose Category",
                            items: state.serviceCategories,
                            selectedNotifier: selectedCategoryNotifier,
                            itemAsString: (item) => item.cName,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                AppSpacing.h14,

                CustomTextField(
                  controller: addressCtrl,
                  isTextField: true,
                  label: "Customer Address",
                  hintText: "Enter Customer Address",
                ),

                AppSpacing.h14,

                CustomTextField(
                  controller: findingsCtrl,
                  isTextField: true,
                  label: "Customer Findings",
                  hintText: "Enter Customer Findings",
                ),

                AppSpacing.h40,

                /// BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: ContainerButton(
                        height: 55.h,
                        textStyle: AppTextStyle.kTitleMediumTextStyle(),
                        alignment: Alignment.center,
                        text: "Cancel",
                        color: AppColors.whiteColor,
                        radius: BorderRadius.circular(10.r),
                        border: BoxBorder.all(
                          color: AppColors.textLightColor.withOpacity(0.3),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    AppSpacing.w14,
                    Expanded(
                      child: ContainerButton(
                        alignment: Alignment.center,
                        height: 55.h,
                        text: "Register",
                        color: AppColors.primaryColor,
                        radius: BorderRadius.circular(10.r),
                        textStyle: AppTextStyle.kTitleMediumTextStyle(
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                        ),
                        onTap: () {
                          if (selectedCategoryNotifier.value == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please select category"),
                              ),
                            );
                            return;
                          }

                          final model = InsertServiceComplaintReqModel(
                            scrId: 0,
                            scrCustomerName:
                                customerNameCtrl.text.trim(),
                            scrMobileNo: mobileCtrl.text.trim(),
                            scrEmail: emailCtrl.text.trim(),
                            scrContactNo: contactCtrl.text.trim(),
                            scrCategoryId:
                                selectedCategoryNotifier.value!.cId,
                            scrCustomerAddress:
                                addressCtrl.text.trim(),
                            scrFindings: findingsCtrl.text.trim(),
                            srcIsLedger: false,
                            srcLedgerId: 0,
                            userId: 0,
                          );

                          context.read<RegisterComplaintBloc>().add(
                                InsertServiceComplaintEvent(
                                  insertServiceComplaintReqModel: model,
                                ),
                              );

                          Navigator.pop(context);
                          Get.offAllNamed(PageRoutes.mainPage);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
