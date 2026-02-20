import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class PageNavigation extends StatefulWidget {
  final PageController pageController;
  final int currentPage;
  final VoidCallback onSubmit;

  const PageNavigation({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.onSubmit,
  });

  @override
  State<PageNavigation> createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  @override
  Widget build(BuildContext context) {
    final isFirstPage = widget.currentPage == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (!isFirstPage)
          ContainerButton(
            alignment: Alignment.center,
            radius: BorderRadius.circular(10.r),
            height: 48.h,
            width: 160.w,
            text: '< Previous Page',
            onTap: () {
              widget.pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            color: AppColors.whiteColor,
            textColor: AppColors.darkColor,
            border: Border.all(color: AppColors.dividerColor),
          ),
        if (!isFirstPage) AppSpacing.w16,
        ContainerButton(
          radius: BorderRadius.circular(10.r),
          alignment: Alignment.center,
          height: 48.h,
          width: 160.w,
          text: isFirstPage ? 'Next Page' : 'Submit',
          onTap: isFirstPage
              ? () {
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              : widget.onSubmit,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
