import 'package:flutter/material.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';

class ContainerButton extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? radius;
  final VoidCallback? onTap;
  final bool isWidget;
  final Widget? isChild;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const ContainerButton({
    super.key,
    this.text,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.textStyle,
    this.alignment,
    this.radius,
    required this.onTap,
    this.isWidget = false,
    this.isChild,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          color: color ?? AppColors.primaryColor,
          border: border,
        ),
        alignment: alignment,
        height: height,
        width: width,
        child: isWidget
            ? ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 60, maxWidth: 200),
                child: isChild,
              )
            : Text(
                text ?? "",
                style:
                    textStyle ??
                    AppTextStyle.kTitleMediumTextStyle(
                      fontWeight: FontWeight.w600,
                      fontColor: textColor ?? AppColors.whiteColor,
                    ),
              ),
      ),
    );
  }
}
