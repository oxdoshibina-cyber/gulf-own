import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveGridLayout extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double spacing;
  final double? maxCrossAxisExtent;
  final ScrollPhysics? physics;
  final Key? gridKey; // 👈 ADD THIS

  const ResponsiveGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.spacing = 16,
    this.maxCrossAxisExtent,
    this.physics,
    this.gridKey,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final double effectiveMaxExtent =
        maxCrossAxisExtent ??
        (width >= 1600
            ? 420
            : width >= 1300
            ? 370
            : width >= 900
            ? 320
            : width >= 600
            ? 280
            : 260);

    return MasonryGridView.builder(
      key: gridKey, // 🔥 IMPORTANT
      padding: EdgeInsets.all(spacing),
      gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: effectiveMaxExtent,
      ),
      mainAxisSpacing: spacing.h,
      crossAxisSpacing: spacing.w,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      physics: physics,
      shrinkWrap: true,
    );
  }
}
