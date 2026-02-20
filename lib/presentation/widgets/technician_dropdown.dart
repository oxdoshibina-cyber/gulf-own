import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class TechnicianDropdown extends StatefulWidget {
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final Color? fillColor;
  final TextStyle? textStyle;

  const TechnicianDropdown({
    super.key,
    this.selectedValue,
    this.onChanged,
    this.fillColor,
    this.textStyle,
  });

  @override
  State<TechnicianDropdown> createState() => _TechnicianDropdownState();
}

class _TechnicianDropdownState extends State<TechnicianDropdown> {
  String? _selectedTechnician;

  // Sample technician list - you can replace this with API data
  final List<String> technicians = [
    'Unassigned',
    'Technician Name',
    'John Doe',
    'Jane Smith',
    'Mike Wilson',
    'Sarah Davis',
    'Tom Anderson',
  ];

  @override
  void initState() {
    super.initState();
    _selectedTechnician = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.fillColor ?? AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.dividerColor,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedTechnician,
          isExpanded: true,
          isDense: true,
          hint: Text(
            'Select Technician',
            style: widget.textStyle ?? AppTextStyle.kTitleMediumTextStyle(),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.textLightColor,
            size: 24.sp,
          ),
          style: widget.textStyle ?? AppTextStyle.kTitleMediumTextStyle(),
          dropdownColor: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          items: technicians.map((String technician) {
            return DropdownMenuItem<String>(
              value: technician,
              child: Text(
                technician,
                style: widget.textStyle ?? AppTextStyle.kTitleMediumTextStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedTechnician = newValue;
            });
            widget.onChanged?.call(newValue);
          },
        ),
      ),
    );
  }
}
