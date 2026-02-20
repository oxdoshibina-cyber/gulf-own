import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class DataTileWidget extends StatelessWidget {
  final String text1;
  final String text2;

  const DataTileWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 187.5.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xffF8F9FE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 Prevent overflow
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.kTitleMediumTextStyle(),
          ),
          SizedBox(height: 6.h),
          Text(
            text2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.kTitleMediumTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
