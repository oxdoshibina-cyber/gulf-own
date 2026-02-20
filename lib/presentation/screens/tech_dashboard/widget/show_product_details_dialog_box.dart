import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';

class ShowProductDetailsDialogBox extends StatefulWidget {
  const ShowProductDetailsDialogBox({super.key});

  @override
  State<ShowProductDetailsDialogBox> createState() =>
      _ShowProductDetailsDialogBoxState();
}

class _ShowProductDetailsDialogBoxState
    extends State<ShowProductDetailsDialogBox> {
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
                      "Product Details",
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

                /// CONTENT (FIXED HEIGHT)
                SizedBox(
                  height: 350.h, // ✅ decent & consistent height
                  child: _buildProductDetails(state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductDetails(TechDashboardState state) {
    /// 🔄 LOADING
    if (state.isProductDetailsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final products = state.productDetailsResModel;

    /// ❌ EMPTY
    if (products.isEmpty) {
      return const Center(child: Text("No product details found"));
    }

    /// ✅ DATA
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];

        return GestureDetector(
          onTap: () {
            log(
              "Product batch tapped → irId=${item.irId}, qty=${item.qty}",
              name: "ProductDetailsDialog",
            );
            context.read<TechDashboardBloc>().add(
              SelectProductBatchEvent(item),
            );
            Navigator.pop(context);
          },
          child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Batch No",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0A2A52),
                      ),
                    ),
                    Text(
                      item.uniqueCode.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0A2A52),
                      ),
                    ),
                  ],
                ),
                AppSpacing.h4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MRP',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    Text(
                      item.mrp.toString(),
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ],
                ),
                AppSpacing.h2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Retail',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    Text(
                      item.retail.toString(),
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      item.qty.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
