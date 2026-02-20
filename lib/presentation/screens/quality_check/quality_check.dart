import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/app_bar_widget.dart';
import 'widgets/quality_check_data_card.dart';

class QualityCheck extends StatefulWidget {
  const QualityCheck({super.key});

  @override
  State<QualityCheck> createState() => _QualityCheckState();
}

class _QualityCheckState extends State<QualityCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: AppBarWidget(
          text: "QUALITY CHECK",
          isTrailing: true,
          trailing: SizedBox(
            width: 300.w,
            child: CustomTextField<String>(
              isTextField: true,
              hintText: "Search Technician",
              onChanged: (value) {},
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.greyColor,
                size: 22.sp,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveGridLayout(
          itemCount: 15,
          itemBuilder: (context, index) {
            return QualityCheckDataCard(
              tokenNumber: '#342',
              technicianName: 'Technician Name',
              employeeId: 'EmplyId',
              customerName: 'Customer Name',
              model: 'S23 Ultra',
              approvalStatus: false
            );
          },
        ),
      ),
    );
  }
}
