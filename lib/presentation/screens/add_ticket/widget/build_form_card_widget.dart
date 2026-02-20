import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_brand_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_card_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_cash_model.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/presentation/bloc/add_tickets/add_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/assign_tickets/assign_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/searchable_drop_down.dart';


class BuildFormCardWidget extends StatefulWidget {
  final TextEditingController customerController;
  final TextEditingController bankAmountController;
  final TextEditingController cashAmountController;
  final TextEditingController modelNoController;
  final TextEditingController imeiController;
  final TextEditingController batteryNoController;
  final TextEditingController estimateCostController;
  final TextEditingController advanceAmountController;
  final ValueNotifier<GetServiceBrandModel?> brandNameNotifier;
  final ValueNotifier<GetServiceCashModel?> cashAccountNotifier;
  final ValueNotifier<GetServiceCardModel?> bankAccountNotifier;
  final ValueNotifier<GetServiceCategory?> categoryNotifier;
  final ValueNotifier<DateTime?> expectedDeliveryDateNotifier;
  const BuildFormCardWidget({
    super.key,
    required this.customerController,
    required this.bankAmountController,
    required this.cashAmountController,
    required this.modelNoController,
    required this.imeiController,
    required this.batteryNoController,
    required this.estimateCostController,
    required this.advanceAmountController,
    required this.brandNameNotifier,
    required this.cashAccountNotifier,
    required this.bankAccountNotifier,
    required this.categoryNotifier,
    required this.expectedDeliveryDateNotifier,
  });

  @override
  State<BuildFormCardWidget> createState() => _BuildFormCardWidgetState();
}

class _BuildFormCardWidgetState extends State<BuildFormCardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignTicketsBloc, AssignTicketsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: _cardDecoration(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      label: 'Customer Name',
                      hintText: 'Enter Customer Name',
                      controller: widget.customerController,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: BlocBuilder<AddTicketsBloc, AddTicketsState>(
                      buildWhen: (p, c) => p.serviceBrands != c.serviceBrands,
                      builder: (context, state) {
                        return SearchableDropdown<GetServiceBrandModel>(
                          label: "Brand Name",
                          hintText: "Choose Brand",
                          items: state.serviceBrands,
                          selectedNotifier: widget.brandNameNotifier,
                          itemAsString: (item) => item.companyName,
                          validatorFunction: (value) {
                            if (value == null) return 'Brand is required';
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      hintText: 'Enter Model No',
                      label: 'Model No.',
                      controller: widget.modelNoController,
                      keyboardType: TextInputType.number,
                      validatorFunction: (value) {
                        if (value == null || value.toString().trim().isEmpty) {
                          return 'Model number is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              AppSpacing.h16,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      hintText: 'Enter IMEI Number',
                      label: 'IMEI Number',
                      controller: widget.imeiController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      hintText: 'Enter Battery No',
                      label: 'Battery No.',
                      controller: widget.batteryNoController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(child: _buildDatePicker()),
                ],
              ),
              AppSpacing.h16,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      hintText: 'Enter Estimate Cost',
                      label: 'Estimate Cost',
                      controller: widget.estimateCostController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      hintText: 'Enter Advance Amount',
                      label: 'Advance Amount',
                      controller: widget.advanceAmountController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      hintText: 'Enter Cash Amount',
                      label: 'Cash Amount',
                      controller: widget.cashAmountController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: BlocBuilder<AddTicketsBloc, AddTicketsState>(
                      buildWhen: (p, c) => p.getServiceCash != c.getServiceCash,
                      builder: (context, state) {
                        return SearchableDropdown<GetServiceCashModel>(
                          label: 'Cash/Account',
                          hintText: "Select",
                          items: state.getServiceCash,
                          selectedNotifier: widget.cashAccountNotifier,
                          itemAsString: (item) => item.name,
                        );
                      },
                    ),
                  ),
                ],
              ),
              AppSpacing.h16,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      isTextField: true,
                      hintText: 'Enter Bank Amount',
                      label: 'Bank Amount',
                      controller: widget.bankAmountController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: BlocBuilder<AddTicketsBloc, AddTicketsState>(
                      buildWhen: (p, c) => p.getServiceCard != c.getServiceCard,
                      builder: (context, state) {
                        return SearchableDropdown<GetServiceCardModel>(
                          label: 'Bank',
                          hintText: "Select",
                          items: state.getServiceCard,
                          selectedNotifier: widget.bankAccountNotifier,
                          itemAsString: (item) => item.name,
                        );
                      },
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child:
                        BlocBuilder<
                          RegisterComplaintBloc,
                          RegisterComplaintState
                        >(
                          buildWhen: (p, c) =>
                              p.serviceCategories != c.serviceCategories,
                          builder: (context, state) {
                            return SearchableDropdown<GetServiceCategory>(
                              label: "Category",
                              hintText: "Choose Category",
                              items: state.serviceCategories,
                              selectedNotifier: widget.categoryNotifier,
                              itemAsString: (item) => item.cName,
                            );
                          },
                        ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expect Delivery Date',
          style: AppTextStyle.kTitleMediumTextStyle(
            fontColor: AppColors.textLightColor,
          ),
        ),
        AppSpacing.h8,
        GestureDetector(
          onTap: _pickDate,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.dividerColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder<DateTime?>(
                  valueListenable: widget.expectedDeliveryDateNotifier,
                  builder: (context, date, _) {
                    return Text(
                      date != null
                          ? '${date.day}-${date.month}-${date.year}'
                          : 'Choose Date',
                    );
                  },
                ),

                Icon(
                  Icons.calendar_today,
                  size: 18.sp,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: widget.expectedDeliveryDateNotifier.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      widget.expectedDeliveryDateNotifier.value = date;
    }
  }
}
