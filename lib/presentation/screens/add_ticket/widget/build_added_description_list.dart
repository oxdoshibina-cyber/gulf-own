import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/ticket_detail_widget.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/description_card.dart';

class BuildAddedDescriptionList extends StatelessWidget {
  final ValueNotifier<List<AddedDescriptionItem>> addedDescriptionsNotifier;

  const BuildAddedDescriptionList({
    super.key,
    required this.addedDescriptionsNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<AddedDescriptionItem>>(
      valueListenable: addedDescriptionsNotifier,
      builder: (context, list, _) {
        if (list.isEmpty) return const SizedBox.shrink();

        return Column(
          children: List.generate(
            list.length,
            (index) => Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: DescriptionCard(
                description: list[index].descriptionName,
                remarks: list[index].remarks,
              ),
            ),
          ),
        );
      },
    );
  }
}
