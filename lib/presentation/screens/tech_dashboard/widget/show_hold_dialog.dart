import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/domain/common/enums/enum.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';

class ShowHoldDialog extends StatefulWidget {
  const ShowHoldDialog({super.key});

  @override
  State<ShowHoldDialog> createState() => _ShowHoldDialogState();
}

class _ShowHoldDialogState extends State<ShowHoldDialog> {
  TextEditingController reasonController = TextEditingController();
  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: SizedBox(
        width: 330.w, // 🔥 reduced width (adjust as you like)
        child: Container(
          color: AppColors.whiteColor,
          padding: EdgeInsets.all(22.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Text(
                "Hold It",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              AppSpacing.h6,

              /// SUBTITLE
              Text(
                "Are you sure you want Hold it?",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),

              AppSpacing.h16,

              /// TEXT FIELD
              TextField(
                maxLines: 4,
                style: TextStyle(
                  // ✅ ADD THIS
                  fontSize: 14.sp, // or 15.sp
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.w500,
                ),
                controller: reasonController,
                decoration: InputDecoration(
                  hintText: "Enter reason",
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  contentPadding: EdgeInsets.all(16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              AppSpacing.h25,

              /// BUTTONS
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 2,
                        shadowColor: Colors.grey.withOpacity(0.2),
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
                  AppSpacing.w12,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final reason = reasonController.text.trim();
                        context.read<TechDashboardBloc>().add(
                          UpdateTechnicianEvent(ResponseType.hold),
                        );
                        // ✅ Reason is optional → return empty string if not entered
                        Navigator.pop(context, reason);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffD64545),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      child: Text(
                        "Hold",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
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
      ),
    );
  }
}
