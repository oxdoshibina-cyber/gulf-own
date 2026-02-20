import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';

class AppBarWidget extends StatelessWidget {
  final String? text;
  final String? arrowText;
  final bool isRow;
  final bool isArrow;
  final bool isTrailing;
  final Widget? trailing;
  final Widget? subtitleWidget;
  final VoidCallback? onTap;

  const AppBarWidget({
    super.key,
    this.text,
    this.arrowText,
    this.isRow = false,
    this.isArrow = false,
    this.isTrailing = true,
    this.trailing,
    this.subtitleWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //isArrow
        isArrow
            ? GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    ResponsiveSvgIcon(
                      asset: SvgRes.backIcon,
                      color: AppColors.textLightColor,
                      size: 30.sp,
                    ),
                    AppSpacing.w16,
                    Text(
                      arrowText ?? '',
                      style: AppTextStyle.kLargeTextStyle(),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),

        /// Title text
        ///
        isRow == false
            ? Text(text ?? "", style: AppTextStyle.kLargeTextStyle())
            : subtitleWidget ?? SizedBox.shrink(),

        const Spacer(),

        /// Trailing area with bounded width
        if (isTrailing && trailing != null)
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.55, // 55%
            ),
            child: trailing!,
          ),
      ],
    );
  }
}
