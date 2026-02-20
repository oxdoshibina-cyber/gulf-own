import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gulfownsalesview/presentation/screens/delivery/widget/jobcard_screen.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../router/page_routes.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/responsive_grid_layout.dart';
import '../../widgets/technician_dropdown.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: AppBarWidget(
          text: "DELIVERY",
          isTrailing: true,
          trailing: SizedBox(
            height: 57.h,
            width: 350.w,
            child: TechnicianDropdown(
              fillColor: AppColors.backgroundColor,
              textStyle: AppTextStyle.kTitleMediumTextStyle(),
              onChanged: (value) {
                // Handle technician selection
                print('Selected technician: $value');
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveGridLayout(
          itemCount: 15,
          itemBuilder: (context, index) {
            return JobCard();
          },
        ),
      ),
    );
  }
}
