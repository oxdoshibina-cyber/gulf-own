import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/common/enums/enum.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/selection_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

import '../../../../domain/items_collected/model/insert_items_collected_req_model.dart';
import '../../../../domain/register_complaint/model/get_service_category.dart';
import '../../../bloc/items_collected/items_collected_bloc.dart';
import '../../../bloc/register_complaint/register_complaint_bloc.dart';
import '../../../router/page_routes.dart';
import '../../../widgets/searchable_drop_down.dart';

class AddItemsCollectedDialogBox extends StatefulWidget {
  final bool isEdit;

  const AddItemsCollectedDialogBox({super.key, required this.isEdit, });

  @override
  State<AddItemsCollectedDialogBox> createState() =>
      _AddItemsCollectedDialogBoxState();
}

class _AddItemsCollectedDialogBoxState
    extends State<AddItemsCollectedDialogBox> {
  ValueNotifier<ResponseType> responseNotifier = ValueNotifier(
    ResponseType.active,
  );
  final ValueNotifier<GetServiceCategory?> categoryNotifier = ValueNotifier(
    null,
  );

  @override
  void initState() {
    super.initState();
    // categoryNotifier = ValueNotifier(null);
    /// Fetch categories
    context.read<RegisterComplaintBloc>().add(const GetServiceCategoryEvent());

    if (widget.isEdit && categoryNotifier.value == null) {
      //       final icState = context.read<ItemsCollectedBloc>().state;
      //
      //       responseNotifier.value = ResponseType.values[icState.collectedItem!.iicStatus];
      //       log("hghghhhghg   ${icState.collectedItem!.iicStatus}");
      // log("${responseNotifier.value}");
    }
  }

  @override
  void dispose() {
    categoryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: MultiBlocListener(
        listeners: [
          /// 🔹 IC FETCH / SAVE / UPDATE LISTENER
          BlocListener<ItemsCollectedBloc, ItemsCollectedState>(
            listenWhen: (p, c) =>
                p.isSuccess != c.isSuccess ||
                p.isUpdateSuccess != c.isUpdateSuccess,
            listener: (context, state) {
              log("state.isSuccess ${state.isSuccess}");
              log("state.isUpdateSuccess ${state.isUpdateSuccess}");
              log("state.isError ${state.isError}");
              log(
                "state.commonResponseModel?.message a${state.commonResponseModel?.message}a",
              );
              log(
                "state.commonResponseModel?.status ${state.commonResponseModel?.status}",
              );

              // if(state.isError || state.isUpdateError || state.commonResponseModel?.message =='Item already exists'){
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text(state.commonResponseModel!.message),
              //       backgroundColor: Colors.red,
              //       duration: Duration(seconds: 2),
              //     ),
              //   );
              // }
              // else
              if (state.isSuccess) {
                /// 1️⃣ Close dialog
                Navigator.pop(context);

                log("state.itemsCollectedList ${state.itemsCollectedList}");

                if (state.commonResponseModel!.message.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(child: Text("Item added successfully")),
                      backgroundColor: Colors.green,
                    ),
                  );
                }

                if (state.commonResponseModel?.message ==
                    'Item already exists') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(
                        child: Text(state.commonResponseModel!.message),
                      ),

                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }

                /// 2️⃣ Refresh list
                context.read<ItemsCollectedBloc>().add(
                  const GetItemsCollectedEvent(),
                );

                /// 3️⃣ Clear edit flags AFTER refresh
                context.read<ItemsCollectedBloc>().add(
                  const ClearItemsCollectedFlag(),
                );
              }
            },
          ),

          /// 🔹 CATEGORY + EDIT SYNC LISTENER (THIS FIXES PREFILL)
          BlocListener<RegisterComplaintBloc, RegisterComplaintState>(
            listenWhen: (p, c) => p.serviceCategories != c.serviceCategories,
            listener: (context, regState) {
              final icState = context.read<ItemsCollectedBloc>().state;

              log("categoryNotifier.value ${categoryNotifier.value}");
              log("regState.serviceCategories ${regState.serviceCategories}");
              log(
                "icState.updateItemsCollectedReqModel?.iicName ${icState.updateItemsCollectedReqModel?.iic_name}",
              );
              log(
                "icState.updateItemsCollectedReqModel?.iicId ${icState.updateItemsCollectedReqModel?.iic_id}",
              );
              log(
                "icState.updateItemsCollectedReqModel?.iicStatus ${icState.updateItemsCollectedReqModel?.iic_status}",
              );
              log(
                "icState.updateItemsCollectedReqModel?.iicRemarks ${icState.updateItemsCollectedReqModel?.iic_remarks}",
              );

              if (widget.isEdit &&
                  regState.serviceCategories.isNotEmpty &&
                  categoryNotifier.value == null) {
                final matchedCategory = regState.serviceCategories.firstWhere(
                  (e) =>
                      e.cName == icState.updateItemsCollectedReqModel?.iic_name,
                );
                log("matchedCategory ${matchedCategory.cName}");
                log("responseNotifier ${responseNotifier.value}");
                log(
                  "${ResponseType.values[icState.updateItemsCollectedReqModel?.iic_status ?? 0]}",
                );

                categoryNotifier.value = matchedCategory;
                responseNotifier.value =
                    ResponseType.values[icState
                            .updateItemsCollectedReqModel
                            ?.iic_status ??
                        0];
              }
            },
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            return ConstrainedBox(
              constraints: BoxConstraints(
                /// 🔥 Updated responsive width rule
                maxWidth: maxWidth > 900.w ? 650.w : 0.9.sw,
                minWidth: 350.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// ---- Title ----
                    Text(
                      "Add Items",
                      style: AppTextStyle.kLargeTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        fontColor: AppColors.darkColor,
                      ),
                    ),

                    AppSpacing.h12,

                    // CustomTextField(
                    //   isTextField: false,
                    //   isSearch: true,
                    //   fillColor: Colors.white,
                    //   // label: "Category",
                    //   hintText: "Enter Item", // Used as display when empty
                    //   dropDownText: "Choose category",
                    //   dropDownHintText: "Search Technician",
                    //   items: [
                    //     "Laptop",
                    //     "Mobile",
                    //     "Note Pad",
                    //     "Home Theater",
                    //     "Smart Watch",
                    //   ],
                    //   valueNotifier: categoryNotifier,
                    // ),
                    BlocBuilder<RegisterComplaintBloc, RegisterComplaintState>(
                      buildWhen: (p, c) =>
                          p.serviceCategories != c.serviceCategories,
                      builder: (context, state) {
                        return SearchableDropdown<GetServiceCategory>(
                          label: "Category",
                          hintText: "Choose Category",
                          items: state.serviceCategories,
                          selectedNotifier: categoryNotifier,
                          itemAsString: (item) => item.cName,
                        );
                      },
                    ),
                    AppSpacing.h20,
                    Row(
                      children: [
                        SelectionWidget<ResponseType>(
                          selectedNotifier: responseNotifier,
                          value: ResponseType.active,
                          onSelected: (value) => responseNotifier.value = value,
                          labelBuilder: (value) => value.title,
                        ),

                        AppSpacing.w10,
                        SelectionWidget<ResponseType>(
                          selectedColor:AppColors.redColor,
                          checkColor: AppColors.redColor,
                          selectedNotifier: responseNotifier,
                          value: ResponseType.inActive,
                          onSelected: (value) => responseNotifier.value = value,
                          labelBuilder: (value) => value.title,
                        ),
                      ],
                    ),
                    AppSpacing.h32,

                    /// ---- Buttons ----
                    Row(
                      children: [
                        Expanded(
                          child: ContainerButton(
                            alignment: Alignment.center,
                            height: 55.h,
                            radius: BorderRadius.circular(10.r),
                            onTap: () => Navigator.pop(context),
                            text: "Cancel",
                            textStyle: AppTextStyle.kTitleMediumTextStyle(),
                            color: AppColors.whiteColor,
                            border: BoxBorder.all(
                              color: AppColors.textLightColor.withOpacity(0.3),
                            ),
                          ),
                        ),
                        AppSpacing.w14,
                        Expanded(
                          child: ContainerButton(
                            alignment: Alignment.center,
                            height: 55.h,
                            radius: BorderRadius.circular(10.r),
                            onTap: () {
                              if (categoryNotifier.value == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please select category"),
                                  ),
                                );
                                return;
                              }

                              log(
                                "jjjjjjjjj categoryNotifier.value!.cName ${categoryNotifier.value!.cName}",
                              );

                              if (widget.isEdit) {
                                log("editing started...........");
                              final model = InsertItemsCollectedReqModel(
                                iic_id: context.read<ItemsCollectedBloc>().state.updateItemsCollectedReqModel!.iic_id,
                                iic_name: categoryNotifier.value!.cName,
                                iic_status: responseNotifier.value.index,
                                iic_remarks: "",

                              );
                              context.read<ItemsCollectedBloc>().add(
                                UpdateItemsCollectedEvent(
                                    updateItemsCollectedReqModel: model
                                ,
                                  ),
                                );
                              } else {
                                final model = InsertItemsCollectedReqModel(
                                  iic_id: 0,
                                  iic_name: categoryNotifier.value!.cName,
                                  iic_status: responseNotifier.value.index,
                                  iic_remarks: "",
                                );
                                context.read<ItemsCollectedBloc>().add(
                                  InsertItemsCollectedEvent(
                                    insertItemsCollectedReqModel: model,
                                  ),
                                );
                              }
                              // Navigator.pop(context);
                              // Get.offAllNamed(PageRoutes.mainPage, arguments: 9);
                            },
                            text: widget.isEdit ? "Update" : "Save",
                            textStyle: AppTextStyle.kTitleMediumTextStyle(
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.whiteColor,
                            ),
                            color: AppColors.primaryColor,
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
      ),
    );
  }
}
