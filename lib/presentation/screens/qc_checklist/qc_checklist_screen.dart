import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/bloc/qc_checklist/qc_checklist_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/qc_checklist/widget/check_list_widget.dart';
import 'package:gulfownsalesview/presentation/screens/qc_checklist/widget/qc_check_list_dialog_box.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';

class QcChecklistScreen extends StatefulWidget {
  const QcChecklistScreen({super.key});

  @override
  State<QcChecklistScreen> createState() => _QcChecklistScreenState();
}

class _QcChecklistScreenState extends State<QcChecklistScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QcChecklistBloc>().add(const GetAllQcChecklistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: AppBarWidget(
          text: "QC CHECK LIST",
          isTrailing: true,
          trailing: ContainerButton(
            alignment: Alignment.center,
            radius: BorderRadius.circular(10.r),
            height: 48.h,
            width: 140.w,
            text: "ADD QC",
            onTap: () {
              context.read<QcChecklistBloc>().add(
                const ClearFetchQcChecklistFlag(),
              );

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const QcCheckListDialogBox(),
              );
            },
          ),
        ),
      ),
      body: BlocListener<QcChecklistBloc, QcChecklistState>(
        listenWhen: (p, c) =>
            p.isFetchIdLoading != c.isFetchIdLoading && c.isFetchIdSuccess,
        listener: (context, state) {
          /// 🔥 OPEN DIALOG ONLY AFTER DATA IS READY
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const QcCheckListDialogBox(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<QcChecklistBloc, QcChecklistState>(
            builder: (context, state) {
              return ResponsiveGridLayout(
                gridKey: ValueKey(
                  state.qcChecklist.length,
                ), // 🔥 THIS FIXES DELETE
                itemCount: state.qcChecklist.length,
                itemBuilder: (context, index) {
                  final model = state.qcChecklist[index];
                  return CheckListWidget(
                    key: ValueKey(model.qcId),
                    onDeleteTap: () {
                      showDeleteConfirmDialog(
                        context: context,
                        onConfirm: () {
                          context.read<QcChecklistBloc>().add(
                            DeleteQcChecklistEvent(qcId: model.qcId),
                          );
                        },
                      );
                    },

                    itemName: model.qcName,
                    checkList: model.qcCategory,
                    onTap: () {
                      context.read<QcChecklistBloc>().add(
                        FetchQcChecklistByIdEvent(qcId: model.qcId),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> showDeleteConfirmDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;

              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: maxWidth > 900.w ? 500.w : 0.9.sw,
                  minWidth: 320.w,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 25.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// ---- Title ----
                      Text(
                        "Delete QC Checklist",
                        style: AppTextStyle.kLargeTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                          fontColor: AppColors.darkColor,
                        ),
                      ),

                      AppSpacing.h12,

                      /// ---- Message ----
                      Text(
                        "Are you sure you want to delete this checklist?",
                        style: AppTextStyle.kTitleMediumTextStyle(
                          fontColor: AppColors.textLightColor,
                        ),
                      ),

                      AppSpacing.h32,

                      /// ---- Buttons ----
                      Row(
                        children: [
                          Expanded(
                            child: ContainerButton(
                              height: 55.h,
                              radius: BorderRadius.circular(10.r),
                              alignment: Alignment.center,
                              text: "Cancel",
                              color: AppColors.whiteColor,
                              border: Border.all(
                                // ignore: deprecated_member_use
                                color: AppColors.textLightColor.withOpacity(
                                  0.3,
                                ),
                              ),
                              textStyle: AppTextStyle.kTitleMediumTextStyle(),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          AppSpacing.w14,
                          Expanded(
                            child: ContainerButton(
                              height: 55.h,
                              radius: BorderRadius.circular(10.r),
                              alignment: Alignment.center,
                              text: "Delete",
                              color: Colors.red,
                              textStyle: AppTextStyle.kTitleMediumTextStyle(
                                fontWeight: FontWeight.w600,
                                fontColor: AppColors.whiteColor,
                              ),
                              onTap: () async {
                                Navigator.pop(context); // close dialog
                                onConfirm(); // 🔥 call delete

                                await Future.delayed(
                                  const Duration(milliseconds: 800),
                                );

                                Get.offAllNamed(
                                  PageRoutes.mainPage,
                                  arguments: 5,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
