import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/assign_technician_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/assign_tickets/assign_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class AssignWorkDialog extends StatelessWidget {
  final String technicianName;
  final int entryNo;
  final int technicianId;
  const AssignWorkDialog({
    super.key,
    required this.technicianName,
    required this.entryNo,
    required this.technicianId,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return ConstrainedBox(
            constraints: BoxConstraints(
              // Responsive width for all layouts
              maxWidth: maxWidth > 600.w ? 400.w : 0.9.sw,
              minWidth: 300.w,
              // Height will grow automatically
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 👈 Auto-height
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assign to",
                    style: AppTextStyle.kLargeTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                      fontColor: AppColors.primaryColor,
                    ),
                  ),

                  AppSpacing.h8,

                  Text(
                    "Are you sure you want to assign this ticket?",
                    style: AppTextStyle.kTitleMediumTextStyle(
                      fontColor: AppColors.textLightColor,
                    ),
                  ),

                  AppSpacing.h20,

                  Container(
                    height: 50.h,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.textLightColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      technicianName,
                      style: AppTextStyle.kLargeTextStyle(
                        fontColor: AppColors.primaryColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),

                  AppSpacing.h20,

                  Row(
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 48.h, // Minimum tap height
                          ),
                          child: ContainerButton(
                            radius: BorderRadius.circular(12.r),
                            color: AppColors.whiteColor,
                            border: BoxBorder.all(
                              color: AppColors.textLightColor.withOpacity(0.3),
                            ),
                            alignment: Alignment.center,
                            onTap: () => Navigator.pop(context),
                            text: "Not Now",
                            textStyle: AppTextStyle.kPageHeadingTextStyle(
                              fontColor: AppColors.redColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),

                      AppSpacing.w12,

                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 48.h),
                          child: ContainerButton(
                            radius: BorderRadius.circular(12.r),
                            alignment: Alignment.center,
                            color: AppColors.primaryColor,
                            onTap: () async {
                              final model = AssignTechnicianReqModel(
                                entryNo: entryNo,
                                id: technicianId,
                              );

                              context.read<AssignTicketsBloc>().add(
                                AssignTechnicianEvent(
                                  assignTechnicianReqModel: model,
                                ),
                              );
                              Navigator.pop(context);
                              await Future.delayed(
                                const Duration(milliseconds: 800),
                              );

                              Get.offAllNamed(
                                PageRoutes.mainPage,
                                arguments: 2,
                              );
                            },
                            text: "Confirm",
                            textStyle: AppTextStyle.kPageHeadingTextStyle(
                              fontColor: AppColors.whiteColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
