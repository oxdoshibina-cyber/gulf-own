import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/relocate_technician_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';

class ShowTechnicianRelocatePopUp extends StatefulWidget {
  final int siEntryNo;
  final int asId;
  const ShowTechnicianRelocatePopUp({
    super.key,
    required this.siEntryNo,
    required this.asId,
  });

  @override
  State<ShowTechnicianRelocatePopUp> createState() =>
      _ShowTechnicianRelocatePopUpState();
}

class _ShowTechnicianRelocatePopUpState
    extends State<ShowTechnicianRelocatePopUp> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: 340.w,
        padding: EdgeInsets.all(22.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Technician Relocate",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),

            AppSpacing.h6,

            Text(
              "Are you sure you want Relocate?",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),

            AppSpacing.h20,

            TextField(
              controller: controller,
              maxLines: 4,
              style: TextStyle(
                // ✅ ADD THIS
                fontSize: 14.sp, // or 15.sp
                color: AppColors.darkColor,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Enter reason",

                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textLightColor,
                  fontWeight: FontWeight.w500,
                ),
                contentPadding: EdgeInsets.all(16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
              ),
            ),

            AppSpacing.h25,

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 2,
                      shadowColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                AppSpacing.h12,

                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final remarks = controller.text.trim();

                      if (remarks.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Reason is required"),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      }

                      final model = RelocateTechnicianReqModel(
                        siEntryNo: widget.siEntryNo, // ✅ PASSED VALUE
                        asId: widget.asId, // ✅ PASSED VALUE
                        remarks: remarks,
                      );

                      context.read<TechDashboardBloc>().add(
                        RelocateTechnicianEvent(
                          relocateTechnicianReqModel: model,
                        ),
                      );

                      await Future.delayed(const Duration(milliseconds: 800));

                      Get.offAllNamed(
                        PageRoutes.technicianAssignTicketScreen,
                        arguments: widget.siEntryNo,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff001E4D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
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
  }
}
