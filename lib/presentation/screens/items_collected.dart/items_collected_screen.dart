import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/presentation/screens/items_collected.dart/widget/add_items_collected_dialog_box.dart';
import 'package:gulfownsalesview/presentation/screens/items_collected.dart/widget/items_collected_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';

import '../../bloc/items_collected/items_collected_bloc.dart';

class ItemsCollectedScreen extends StatefulWidget {
  const ItemsCollectedScreen({super.key});

  @override
  State<ItemsCollectedScreen> createState() => _ItemsCollectedScreenState();
}

class _ItemsCollectedScreenState extends State<ItemsCollectedScreen> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<ItemsCollectedBloc>().add(const GetItemsCollectedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: AppBarWidget(
          text: "ITEMS COLLECTED",
          isTrailing: true,
          trailing: FittedBox(
            fit: BoxFit.scaleDown,
            child: ContainerButton(
              height: 48.h,
              width: 140.w,

              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      AddItemsCollectedDialogBox(isEdit: false,),
                );
              },
              radius: BorderRadius.circular(10.r),
              alignment: Alignment.center,
              text: "ADD ITEMS",
            ),
          ),
        ),
      ),

      body: BlocListener<ItemsCollectedBloc, ItemsCollectedState>(
        listenWhen: (p, c) =>
        p.isFetchIdLoading != c.isFetchIdLoading && c.isFetchIdSuccess,
        listener: (context, state) {
          /// OPEN DIALOG ONLY AFTER DATA IS READY
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) =>
                AddItemsCollectedDialogBox(isEdit: true,),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ItemsCollectedBloc, ItemsCollectedState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.itemsCollectedList.isEmpty
                  ? Center(
                child: Text(
                  "No items to display",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              )

               : ResponsiveGridLayout(

                itemCount: state.itemsCollectedList.length,
                itemBuilder: (context, index) {
                  return ItemsCollectedWidget(
                    key: ValueKey(state.itemsCollectedList[index].iicId),
                    collectedItem: state.itemsCollectedList[index],
                    onDeleteTap: () {
                      context.read<ItemsCollectedBloc>().add(
                        DeleteItemsCollectedEvent(
                          id: state.itemsCollectedList[index].iicId,
                        ),
                      );
                    },
                    onTap: () {
                      log("state.itemsCollectedList[index].iicId ${state
                          .itemsCollectedList[index].iicId}");

                      context.read<ItemsCollectedBloc>().add(
                        GetItemsCollectedByIdEvent(
                          id: state.itemsCollectedList[index].iicId,
                        ),
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
}
