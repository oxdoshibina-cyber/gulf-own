import 'package:flutter/material.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class HeaderCustomTextField extends StatelessWidget {
  final String text;
  const HeaderCustomTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: AppTextStyle.kTitleMediumTextStyle(
            fontColor: AppColors.textLightColor,
          ),
        ),
        
      ],
    );
  }
}
