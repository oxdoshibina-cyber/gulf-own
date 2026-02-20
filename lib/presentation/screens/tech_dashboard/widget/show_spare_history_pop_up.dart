import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';

class ShowSpareHistoryPopUp extends StatefulWidget {
  const ShowSpareHistoryPopUp({super.key});

  @override
  State<ShowSpareHistoryPopUp> createState() => _ShowSpareHistoryPopUpState();
}

class _ShowSpareHistoryPopUpState extends State<ShowSpareHistoryPopUp> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: BlocBuilder<TechDashboardBloc, TechDashboardState>(
        builder: (context, state) {
          return Container(
            width: 650.w,
            padding: EdgeInsets.all(22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spare Parts History",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 22.sp),
                    ),
                  ],
                ),

                AppSpacing.h20,

                /// CONTENT
                SizedBox(
                  height: 350.h,
                  child: _buildSpareHistoryContent(state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSpareHistoryContent(TechDashboardState state) {
    /// 🔄 LOADING STATE
    if (state.issparePartsHistoryLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final model = state.sparePartHistoryModel;

    /// ❌ EMPTY STATE
    if (model.isEmpty) {
      return const Center(child: Text("No spare history found"));
    }

    /// ✅ DATA STATE
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        final item = model[index];

        return Container(
          margin: EdgeInsets.only(bottom: 14.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.spareName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff0A2A52),
                    ),
                  ),
                  AppSpacing.h4,
                  Text(
                    item.customerName,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  AppSpacing.h2,
                  Text(
                    item.date,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
              Text(
                item.price.toString(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
