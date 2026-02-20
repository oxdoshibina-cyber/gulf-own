import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_admin_relocate_pop_up.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/show_technician_relocate_pop_up.dart';

class ShowRelocatePopup extends StatefulWidget {
  const ShowRelocatePopup({super.key});

  @override
  State<ShowRelocatePopup> createState() => _ShowRelocatePopupState();
}

class _ShowRelocatePopupState extends State<ShowRelocatePopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: 500.w,
        padding: EdgeInsets.all(22.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Relocate",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 22.sp, color: Colors.grey),
                ),
              ],
            ),

            AppSpacing.h6,

            Text(
              "Are you sure you want to assign Admin or Technician",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),

            AppSpacing.h25,

            Row(
              children: [
                Expanded(
                  child: relocateOption(
                    title: "Admin",
                    onTap: () {
                      final ticket = context
                          .read<TechDashboardBloc>()
                          .state
                          .technicianDashboardResModel
                          .ticket;

                      if (ticket == null) return;
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => ShowAdminRelocatePopUp(
                          siEntryNo: ticket.entryNo, // 🔥 ticket id
                          asId: ticket.assignTo, // 🔥 technician id
                        ),
                      );
                    },
                  ),
                ),
                AppSpacing.w12,
                Expanded(
                  child: relocateOption(
                    title: "Technician",
                    onTap: () {
                      final ticket = context
                          .read<TechDashboardBloc>()
                          .state
                          .technicianDashboardResModel
                          .ticket;

                      if (ticket == null) return;
                      Navigator.pop(context);

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => ShowTechnicianRelocatePopUp(
                          siEntryNo: ticket.entryNo, // 🔥 ticket id
                          asId: ticket.assignTo, // 🔥 technician id
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget relocateOption({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
