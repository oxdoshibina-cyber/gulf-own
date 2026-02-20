import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';

class SpareCardWidget extends StatefulWidget {
  final String sparePartsName;
  final String status;
  final String quantity;
  final String saleRate;
  final String gross;
  final String discount;
  final String net;
  final String gst;
  final String total;
  final bool isApproved;
  final VoidCallback onTap;

  const SpareCardWidget({
    super.key,
    required this.sparePartsName,
    required this.status,
    required this.quantity,
    required this.saleRate,
    required this.gross,
    required this.discount,
    required this.net,
    required this.gst,
    required this.total,
    required this.isApproved,
    required this.onTap,
  });

  @override
  State<SpareCardWidget> createState() => _SpareCardWidgetState();
}

class _SpareCardWidgetState extends State<SpareCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: widget.isApproved ? Colors.green : Colors.grey.shade200,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            widget.sparePartsName,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff0A2A52),
            ),
          ),

          AppSpacing.h6,

          /// Status (Approved)
          Text(
            widget.status,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: widget.isApproved ? Colors.green : Colors.red,
            ),
          ),

          AppSpacing.h25,

          /// ROWS AREA (Qty / Sale Rate)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCol("Qty", widget.quantity),
              textCol("Sale Rate", widget.saleRate, green: true, end: true),
            ],
          ),
          AppSpacing.h14,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCol("Gross", widget.gross),
              textCol("Discount", widget.discount, red: true, end: true),
            ],
          ),
          AppSpacing.h14,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCol("Net", widget.net),
              textCol("GST", widget.gst, end: true),
            ],
          ),

          AppSpacing.h16,

          Divider(color: Colors.grey.shade300, thickness: 1),

          AppSpacing.h12,

          /// TOTAL SECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    widget.total,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 38.h,
                child: ElevatedButton(
                  onPressed: widget.onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffDC3545),
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    "Reject",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textCol(
    String title,
    String value, {
    bool green = false,
    bool red = false,
    bool end = false,
  }) {
    return Column(
      crossAxisAlignment: end
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.h4,
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: green
                ? Colors.green
                : red
                ? Colors.red
                : Colors.black87,
          ),
        ),
      ],
    );
  }
}
