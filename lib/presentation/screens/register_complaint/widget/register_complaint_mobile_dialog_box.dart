import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/register_complaint/widget/register_complaint_dialog_box.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

class RegisterComplaintMobileDialogBox extends StatefulWidget {
  const RegisterComplaintMobileDialogBox({super.key});

  @override
  State<RegisterComplaintMobileDialogBox> createState() =>
      _RegisterComplaintMobileDialogBoxState();
}

class _RegisterComplaintMobileDialogBoxState
    extends State<RegisterComplaintMobileDialogBox> {
  final TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterComplaintBloc, RegisterComplaintState>(
      listener: (context, state) {
        /// ❌ Error
        if (state.isMobileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("No complaint found")));
        }

        /// ✅ Success → open next dialog
        if (!state.isMobileLoading) {
          final enteredMobile = mobileController.text.trim();
          Navigator.pop(context);

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => RegisterComplaintDialog(
              serviceComplaints: state.searchedComplaints,
              initialMobile: enteredMobile,
            ),
          );
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600.w, minWidth: 280.w),
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
                  /// Title
                  Text(
                    "Register Complaint",
                    style: AppTextStyle.kTitleMediumTextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.h10,

                  /// Mobile field
                  CustomTextField(
                    controller: mobileController,
                    isTextField: true,
                    keyboardType: TextInputType.phone,
                    hintText: "Search Mobile No.",
                    borderColor: AppColors.greenColor,
                    prefixIcon: SizedBox(
                      width: 50.w,
                      child: Center(
                        child: Text(
                          "+91",
                          style: AppTextStyle.kTitleMediumTextStyle(
                            fontWeight: FontWeight.w700,
                            fontColor: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  AppSpacing.h20,

                  /// Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ContainerButton(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5.r,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          textStyle: AppTextStyle.kTitleMediumTextStyle(),
                          height: 55.h,
                          radius: BorderRadius.circular(10.r),
                          alignment: Alignment.center,
                          text: "Cancel",
                          color: AppColors.whiteColor,
                          border: BoxBorder.all(
                            color: AppColors.textLightColor.withOpacity(0.3),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      AppSpacing.w14,

                      Expanded(
                        child: ContainerButton(
                          height: 55.h,
                          radius: BorderRadius.circular(10.r),
                          alignment: Alignment.center,
                          text: "Search",
                          color: AppColors.primaryColor,
                          textStyle: AppTextStyle.kTitleMediumTextStyle(
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.whiteColor,
                          ),
                          onTap: () {
                            final mobile = mobileController.text.trim();

                            if (mobile.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Enter valid mobile number"),
                                ),
                              );
                              return;
                            }

                            context.read<RegisterComplaintBloc>().add(
                              RegisterComplaintByMobileEvent(mobileNo: mobile),
                            );
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
      ),
    );
  }
}
