// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_description_list_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_brand_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_card_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_cash_model.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/presentation/bloc/items_collected/items_collected_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/build_accessories_section.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/build_added_description_list.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/build_description_section.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/build_form_card_widget.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/page_navigation.dart';

class TicketDetailWidget extends StatefulWidget {
  final PageController pageController;
  final int currentPage;
  final VoidCallback onSubmit;

  final TextEditingController modelNoController;
  final TextEditingController imeiController;
  final TextEditingController batteryNoController;
  final TextEditingController estimateCostController;
  final TextEditingController advanceAmountController;
  final TextEditingController remarksController;
  final TextEditingController customerController;
  final TextEditingController bankAmountController;
  final TextEditingController cashAmountController;

  final ValueNotifier<GetServiceBrandModel?> brandNameNotifier;
  final ValueNotifier<GetServiceCashModel?> cashAccountNotifier;
  final ValueNotifier<GetServiceCardModel?> bankAccountNotifier;
  final ValueNotifier<GetServiceCategory?> categoryNotifier;
  final ValueNotifier<GetDescriptionListModel?> descriptionNotifier;
  final ValueNotifier<List<AddedDescriptionItem>> addedDescriptionsNotifier;

  final ValueNotifier<DateTime?> expectedDeliveryDateNotifier;

  final VoidCallback onPickDate;

  final ValueNotifier<List<String>> selectedAccessoriesNotifier;

  const TicketDetailWidget({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.onSubmit,
    required this.modelNoController,
    required this.imeiController,
    required this.batteryNoController,
    required this.estimateCostController,
    required this.advanceAmountController,
    required this.remarksController,
    required this.customerController,
    required this.brandNameNotifier,
    required this.cashAccountNotifier,
    required this.categoryNotifier,
    required this.descriptionNotifier,
    required this.expectedDeliveryDateNotifier,
    required this.onPickDate,
    required this.selectedAccessoriesNotifier,
    required this.bankAmountController,
    required this.bankAccountNotifier,
    required this.cashAmountController,
    required this.addedDescriptionsNotifier,
  });

  @override
  State<TicketDetailWidget> createState() => _TicketDetailWidgetState();
}

class _TicketDetailWidgetState extends State<TicketDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(50.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFormCardWidget(
            customerController: widget.customerController,
            bankAmountController: widget.bankAmountController,
            cashAmountController: widget.cashAmountController,
            modelNoController: widget.modelNoController,
            imeiController: widget.imeiController,
            batteryNoController: widget.batteryNoController,
            estimateCostController: widget.estimateCostController,
            advanceAmountController: widget.advanceAmountController,
            brandNameNotifier: widget.brandNameNotifier,
            cashAccountNotifier: widget.cashAccountNotifier,
            bankAccountNotifier: widget.bankAccountNotifier,
            categoryNotifier: widget.categoryNotifier,
            expectedDeliveryDateNotifier: widget.expectedDeliveryDateNotifier,
          ),
          AppSpacing.h32,

          BlocBuilder<ItemsCollectedBloc, ItemsCollectedState>(
            buildWhen: (p, c) =>
                p.itemsCollectedList != c.itemsCollectedList ||
                p.isLoading != c.isLoading,
            builder: (context, state) {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              }
              if (state.itemsCollectedList.isEmpty) {
                return const SizedBox();
              }

              final accessories = state.itemsCollectedList
                  .where((e) => e.iicStatus == 1)
                  .map((e) => e.iicName)
                  .toList();

              return BuildAccessoriesSection(
                selectedAccessoriesNotifier: widget.selectedAccessoriesNotifier,
                accessories: accessories,
              );
            },
          ),

          AppSpacing.h32,

          BuildDescriptionSection(
            descriptionNotifier: widget.descriptionNotifier,
            remarksController: widget.remarksController,
            addedDescriptionsNotifier: widget.addedDescriptionsNotifier,
          ),

          /// ✅ THIS WAS MISSING
          AppSpacing.h16,
          BuildAddedDescriptionList(
            addedDescriptionsNotifier: widget.addedDescriptionsNotifier,
          ),

          AppSpacing.h32,
          PageNavigation(
            pageController: widget.pageController,
            currentPage: widget.currentPage,
            onSubmit: widget.onSubmit,
          ),
        ],
      ),
    );
  }
}

class AddedDescriptionItem {
  final int irId;
  final String descriptionName; // for UI display only
  final String remarks;

  AddedDescriptionItem({
    required this.irId,
    required this.descriptionName,
    required this.remarks,
  });
}
