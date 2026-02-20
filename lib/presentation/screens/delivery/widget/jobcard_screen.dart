import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../router/page_routes.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "#342",
                style: AppTextStyle.kTitleSmallTextStyle(
                  fontColor: AppColors.greyColor.withValues(alpha: 0.5),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF43CB65).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  Text(
                  "Completed",
                  style:AppTextStyle.kTitleMediumTextStyle(
                    fontColor: Color(0xFF28A745),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Name
           Text(
            "Mohammed Junais",
            style: AppTextStyle.kTitleMediumTextStyle(
              fontColor: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp
            )
          ),

          const SizedBox(height: 4),

          // Phone
          Text(
            "+91 8976545444",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 14),

          // Job/Technician Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Job Order No.", "67657"),
              _infoColumn("Technician", "Hrishilal"),
            ],
          ),
          const SizedBox(height: 14),

          // Brand / Model Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Brand", "Samsung"),
              _infoColumn("Model", "S23 Ultra"),
            ],
          ),

          const SizedBox(height: 20),

          // Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2A52),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, size: 16.sp),
                      SizedBox(width: 6),
                      Text("Call",style: AppTextStyle.kTitleSmallTextStyle(
                          fontColor: AppColors.whiteColor
                      ),),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    foregroundColor: const Color(0xFF0A2A52),
                    side: const BorderSide(color: Color(0xFF0A2A52)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {

                      Get.toNamed(PageRoutes.finalSettlementScreen);

                  },
                  child:  Text("Final Settlement",style: AppTextStyle.kTitleSmallTextStyle(
                    fontColor: AppColors.primaryColor
                  ),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Re-usable column widget
  Widget _infoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D1B2A),
          ),
        ),
      ],
    );
  }
}
