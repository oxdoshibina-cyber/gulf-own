// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/add_tickets/add_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

class AddDescriptionDialogBox extends StatefulWidget {
  const AddDescriptionDialogBox({super.key});

  @override
  State<AddDescriptionDialogBox> createState() =>
      _AddDescriptionDialogBoxState();
}

class _AddDescriptionDialogBoxState extends State<AddDescriptionDialogBox> {
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTicketsBloc, AddTicketsState>(
      listenWhen: (p, c) =>
          p.isInsertDescriptionLoading != c.isInsertDescriptionLoading ||
          p.isInsertDescriptionSuccess != c.isInsertDescriptionSuccess,
      listener: (context, state) {
        if (state.isInsertDescriptionSuccess) {
          Navigator.pop(context); // ✅ CLOSE dialog
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
                    "Add Description",
                    style: AppTextStyle.kTitleMediumTextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.h10,

                  /// Mobile field
                  CustomTextField(
                    controller: descriptionController,
                    isTextField: true,
                    hintText: "Enter Description",
                    borderColor: AppColors.greenColor,
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

                      BlocBuilder<AddTicketsBloc, AddTicketsState>(
                        builder: (context, state) {
                          return Expanded(
                            child: ContainerButton(
                              height: 55.h,
                              isWidget: true,
                              radius: BorderRadius.circular(10.r),
                              alignment: Alignment.center,
                              isChild: state.isInsertDescriptionLoading
                                  ? CircularProgressIndicator(
                                      color: AppColors.whiteColor,
                                    )
                                  : Text(
                                      "Save",
                                      style: AppTextStyle.kTitleMediumTextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontColor: AppColors.whiteColor,
                                      ),
                                    ),
                              color: AppColors.primaryColor,

                              onTap: () {
                                final description = descriptionController.text
                                    .trim();

                                if (description.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Enter valid mobile number",
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                context.read<AddTicketsBloc>().add(
                                  InsertDescriptionEvent(
                                    insertDescriptionReqModel:
                                        InsertDescriptionReqModel(
                                          descName: description, // ✅ CORRECT
                                        ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
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
