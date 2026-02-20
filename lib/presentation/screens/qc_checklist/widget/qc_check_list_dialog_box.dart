import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/insert_update_qc_checklist_req_model.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/presentation/bloc/qc_checklist/qc_checklist_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';

import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

import '../../../widgets/searchable_drop_down.dart';

class QcCheckListDialogBox extends StatefulWidget {
  const QcCheckListDialogBox({super.key});

  @override
  State<QcCheckListDialogBox> createState() => _QcCheckListDialogBoxState();
}

class _QcCheckListDialogBoxState extends State<QcCheckListDialogBox> {
  final ValueNotifier<GetServiceCategory?> selectedCategoryNotifier =
      ValueNotifier(null);

  final TextEditingController checkListController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// Load categories
    context.read<RegisterComplaintBloc>().add(const GetServiceCategoryEvent());

    /// 🔥 PREFILL CHECKLIST IMMEDIATELY IF EDIT MODE
    final qcState = context.read<QcChecklistBloc>().state;
    if (qcState.isFetchIdSuccess) {
      checkListController.text = qcState.insertUpdateQcChecklistReqModel.qcName;
    }
  }

  @override
  void dispose() {
    selectedCategoryNotifier.dispose();
    checkListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),

      /// 🔥 IMPORTANT PART – HANDLE BOTH BLOCS
      child: MultiBlocListener(
        listeners: [
          /// QC FETCH / SAVE / UPDATE LISTENER
          BlocListener<QcChecklistBloc, QcChecklistState>(
            listenWhen: (p, c) =>
                p.isInsertQcChecklistSuccess != c.isInsertQcChecklistSuccess ||
                p.isUpdateQcChecklistSuccess != c.isUpdateQcChecklistSuccess,
            listener: (context, state) {
              if (state.isInsertQcChecklistSuccess ||
                  state.isUpdateQcChecklistSuccess) {
                /// 1️⃣ Close dialog
                Navigator.pop(context);

                /// 2️⃣ Refresh list
                context.read<QcChecklistBloc>().add(
                  const GetAllQcChecklistEvent(),
                );

                /// 3️⃣ Clear edit flags AFTER refresh
                context.read<QcChecklistBloc>().add(
                  const ClearFetchQcChecklistFlag(),
                );
              }
            },
          ),

          /// 🔹 CATEGORY + EDIT SYNC LISTENER (THIS FIXES PREFILL)
          BlocListener<RegisterComplaintBloc, RegisterComplaintState>(
            listenWhen: (p, c) => p.serviceCategories != c.serviceCategories,
            listener: (context, regState) {
              final qcState = context.read<QcChecklistBloc>().state;

              if (qcState.isFetchIdSuccess &&
                  regState.serviceCategories.isNotEmpty &&
                  selectedCategoryNotifier.value == null) {
                final matchedCategory = regState.serviceCategories.firstWhere(
                  (e) =>
                      e.cId ==
                      qcState.insertUpdateQcChecklistReqModel.qcCategoryId,
                );

                selectedCategoryNotifier.value = matchedCategory;
              }
            },
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxWidth > 900.w ? 650.w : 0.9.sw,
                minWidth: 350.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// ---- Title ----
                      BlocBuilder<QcChecklistBloc, QcChecklistState>(
                        buildWhen: (p, c) =>
                            p.isFetchIdSuccess != c.isFetchIdSuccess,
                        builder: (context, state) {
                          return Text(
                            state.isFetchIdSuccess ? "Update QC" : "Add QC",
                            style: AppTextStyle.kLargeTextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.sp,
                              fontColor: AppColors.darkColor,
                            ),
                          );
                        },
                      ),

                      AppSpacing.h8,

                      /// ---- Fields ----
                      Row(
                        children: [
                          Expanded(
                            child:
                                BlocBuilder<
                                  RegisterComplaintBloc,
                                  RegisterComplaintState
                                >(
                                  buildWhen: (p, c) =>
                                      p.serviceCategories !=
                                      c.serviceCategories,
                                  builder: (context, state) {
                                    return SearchableDropdown<
                                      GetServiceCategory
                                    >(
                                      label: "Category",
                                      hintText: "Choose Category",
                                      items: state.serviceCategories,
                                      selectedNotifier:
                                          selectedCategoryNotifier,
                                      itemAsString: (item) => item.cName,
                                    );
                                  },
                                ),
                          ),
                          AppSpacing.w10,
                          Expanded(
                            child: CustomTextField(
                              isTextField: true,
                              controller: checkListController,
                              label: "Check List",
                              hintText: "Enter Check List",
                            ),
                          ),
                        ],
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
                              onTap: () {
                                context.read<QcChecklistBloc>().add(
                                  const ClearFetchQcChecklistFlag(),
                                );
                                Navigator.pop(context);
                              },
                              text: "Cancel",
                              textStyle: AppTextStyle.kTitleMediumTextStyle(),
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: AppColors.textLightColor.withOpacity(
                                  0.3,
                                ),
                              ),
                            ),
                          ),
                          AppSpacing.w14,
                          BlocBuilder<QcChecklistBloc, QcChecklistState>(
                            buildWhen: (p, c) =>
                                p.isFetchIdSuccess != c.isFetchIdSuccess,
                            builder: (context, state) {
                              final isEdit = state.isFetchIdSuccess;

                              return Expanded(
                                child: ContainerButton(
                                  height: 55.h,
                                  radius: BorderRadius.circular(10.r),
                                  alignment: Alignment.center,
                                  text: isEdit ? "Update" : "Save",
                                  color: AppColors.primaryColor,
                                  textStyle: AppTextStyle.kTitleMediumTextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontColor: AppColors.whiteColor,
                                  ),
                                  onTap: () async {
                                    if (selectedCategoryNotifier.value ==
                                            null ||
                                        checkListController.text
                                            .trim()
                                            .isEmpty) {
                                      return;
                                    }

                                    final model = InsertUpdateQcChecklistReqModel(
                                      qcId: isEdit
                                          ? state
                                                .insertUpdateQcChecklistReqModel
                                                .qcId
                                          : 0,
                                      qcName: checkListController.text.trim(),
                                      qcCategoryId:
                                          selectedCategoryNotifier.value!.cId,
                                      qcIsActive: true,
                                      createdBy: 0,
                                      updatedBy: 0,
                                    );

                                    context.read<QcChecklistBloc>().add(
                                      isEdit
                                          ? UpdateQcChecklistEvent(
                                              updateQcChecklistReqModel: model,
                                            )
                                          : InsertQcChecklistEvent(
                                              insertQcChecklistReqModel: model,
                                            ),
                                    );
                                    await Future.delayed(
                                      const Duration(milliseconds: 800),
                                    );

                                    Get.offAllNamed(
                                      PageRoutes.mainPage,
                                      arguments: 5,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
