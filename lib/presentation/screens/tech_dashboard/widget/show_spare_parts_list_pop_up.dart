import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';

class ShowSparePartsListPopUp extends StatefulWidget {
  const ShowSparePartsListPopUp({super.key});

  @override
  State<ShowSparePartsListPopUp> createState() =>
      _ShowSparePartsListPopUpState();
}

class _ShowSparePartsListPopUpState extends State<ShowSparePartsListPopUp> {
  final ValueNotifier<String> searchNotifier = ValueNotifier("");

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spare Parts List",
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

                AppSpacing.h18,

                /// SEARCH FIELD
                TextField(
                  onChanged: (value) {
                    searchNotifier.value = value;
                  },
                  style: TextStyle(
                    color: AppColors.darkColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search Spare Parts",
                    hintStyle: TextStyle(
                      color: AppColors.textLightColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 22.sp,
                      color: AppColors.textLightColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
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
                      borderSide: BorderSide(
                        color: AppColors.primaryColor, // 🔥 focus color
                        width: 1.4,
                      ),
                    ),
                  ),
                ),

                AppSpacing.h20,

                /// LIST / LOADER
                SizedBox(
                  height: 340.h,
                  child: _buildSpareList(
                    state: state,
                    searchNotifier: searchNotifier,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSpareList({
    required TechDashboardState state,
    required ValueNotifier<String> searchNotifier,
  }) {
    /// 🔄 LOADING
    if (state.isspareListLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final fullList = state.spareListModel;

    if (fullList.isEmpty) {
      return const Center(child: Text("No spare parts found"));
    }

    return ValueListenableBuilder<String>(
      valueListenable: searchNotifier,
      builder: (context, searchText, _) {
        List filteredList;

        /// 🔍 SEARCH MODE → filter full list
        if (searchText.isNotEmpty) {
          filteredList = fullList
              .where(
                (item) => item.irName.toLowerCase().contains(
                  searchText.toLowerCase(),
                ),
              )
              .toList();
        } else {
          /// 🚀 INITIAL LOAD → show only first 20
          filteredList = fullList.take(20).toList();
        }

        if (filteredList.isEmpty) {
          return const Center(child: Text("No spare parts found"));
        }

        return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            final item = filteredList[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: GestureDetector(
                onTap: () {
                  context.read<TechDashboardBloc>().add(
                    SelectSpareEvent(item), // 🔥 store as pending
                    
                  );
                  context.read<TechDashboardBloc>().add(
                    ProductDetailsEvent(id: item.irId),
                  );

                  Navigator.pop(context);
                },
                child: Text(item.irName, style: TextStyle(fontSize: 16.sp)),
              ),
            );
          },
        );
      },
    );
  }
}
