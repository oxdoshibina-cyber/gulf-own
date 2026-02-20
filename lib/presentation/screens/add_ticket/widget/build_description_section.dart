import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_description_list_model.dart';
import 'package:gulfownsalesview/presentation/bloc/add_tickets/add_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/add_description_dialog_box.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/ticket_detail_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/searchable_drop_down.dart';

class BuildDescriptionSection extends StatefulWidget {
  final ValueNotifier<GetDescriptionListModel?> descriptionNotifier;
  final TextEditingController remarksController;
  final ValueNotifier<List<AddedDescriptionItem>> addedDescriptionsNotifier;
  const BuildDescriptionSection({
    super.key,
    required this.descriptionNotifier,
    required this.remarksController,
    required this.addedDescriptionsNotifier,
  });

  @override
  State<BuildDescriptionSection> createState() =>
      _BuildDescriptionSectionState();
}

class _BuildDescriptionSectionState extends State<BuildDescriptionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: _cardDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: BlocListener<AddTicketsBloc, AddTicketsState>(
              listenWhen: (p, c) =>
                  p.isInsertDescriptionSuccess != c.isInsertDescriptionSuccess,
              listener: (context, state) {
                if (state.isInsertDescriptionSuccess &&
                    state.descriptionList.isNotEmpty) {
                  widget.descriptionNotifier.value = state.descriptionList.last;
                }
              },
              child: BlocBuilder<AddTicketsBloc, AddTicketsState>(
                buildWhen: (p, c) => p.descriptionList != c.descriptionList,
                builder: (context, state) {
                  return SearchableDropdown<GetDescriptionListModel>(
                    label: 'Description',
                    hintText: "Choose Description",
                    items: state.descriptionList,
                    selectedNotifier: widget.descriptionNotifier,
                    itemAsString: (item) => item.irName,
                    addButtonText: 'Add New',
                    onAddTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const AddDescriptionDialogBox(),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          AppSpacing.w16,

          Expanded(
            flex: 3,
            child: SizedBox(
              height: 56.h,
              child: CustomTextField(
                isTextField: true,
                hintText: 'Remarks',
                controller: widget.remarksController,
              ),
            ),
          ),

          AppSpacing.w16,

          SizedBox(
            height: 56.h,
            child: ContainerButton(
              width: 120.w,
              alignment: Alignment.center,
              text: 'Add',
              color: AppColors.greenColor,
              radius: BorderRadius.circular(10.r),
              onTap: () {
                final selected = widget.descriptionNotifier.value;
                final remarks = widget.remarksController.text.trim();

                if (selected == null || remarks.isEmpty) return;

                widget.addedDescriptionsNotifier.value = [
                  ...widget.addedDescriptionsNotifier.value,
                  AddedDescriptionItem(
                    irId: selected.irId, // 🔥 THIS IS REQUIRED
                    remarks: remarks,
                    descriptionName: selected.irName,
                  ),
                ];

                widget.remarksController.clear();
                widget.descriptionNotifier.value = null;
              },
            ),
          ),
        ],
      ),
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
}
