// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/domain/notification/model/screen_notification_model.dart';


class AppToast {
  static void showToast(
    BuildContext context, {
    required ScreenNotificationModel model,
  }) {
    showToastWidget(
      _AppToastWidget(key: UniqueKey(), model: model),
      position: const StyledToastPosition(align: Alignment.topRight),
      dismissOtherToast: true,
      isIgnoring: model.isIgnorable,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      context: context,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
      duration: model.duration ?? const Duration(seconds: 4),
    );
  }
}

class _AppToastWidget extends StatelessWidget {
  const _AppToastWidget({super.key, required this.model});

  final ScreenNotificationModel model;

  @override
  Widget build(BuildContext context) {
    final color = _getColorFromType(model.type);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: InkWell(
          onTap: model.callback,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              constraints: BoxConstraints(
                minWidth: 24.w,
                minHeight: 24.h,
                maxWidth: 300.w,
                maxHeight: 200.h,
              ),
              child: Container(
                color: AppColors.whiteColor,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: color, width: 0.2.w),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    color: color.withOpacity(0.12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                model.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: color,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (model.message.isNotEmpty) ...[
                          AppSpacing.h6,
                          Text(
                            model.message,
                            maxLines: 4,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppColors.darkColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                        if (model.callback != null) ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppSpacing.h6,
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: model.callback,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.h,
                                      horizontal: 6.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(2.r),
                                      border: Border.all(
                                        width: 0.2.w,
                                        color: color,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                      ),
                                    ),
                                    child: Text(
                                      model.actionLabel,
                                      style: TextStyle(
                                        color: AppColors.darkColor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Color _getColorFromType(NotificationType type) {
    switch (type) {
      case NotificationType.error:
        return AppColors.redColor;
      case NotificationType.success:
        return AppColors.greenColor;
      case NotificationType.info:
        return AppColors.backgroundColor;
      case NotificationType.warning:
        return AppColors.inProgressColor;
    }
  }
}
