import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponsiveSvgIcon extends StatelessWidget {
  final String asset;
  final Color? color;
  final double size;

  const ResponsiveSvgIcon({
    required this.asset,
    this.color,
    this.size = 22, // base size for adaptive scaling
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      height: size.h, // square for scaling consistency
      child: FittedBox(
        fit: BoxFit.contain,
        child: SvgPicture.asset(
          asset,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        ),
      ),
    );
  }
}
