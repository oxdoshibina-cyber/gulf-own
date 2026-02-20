import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/presentation/bloc/assign_tickets/assign_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/ticket_card.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';

class AssignTicketScreen extends StatefulWidget {
  const AssignTicketScreen({super.key});

  @override
  State<AssignTicketScreen> createState() => _AssignTicketScreenState();
}

class _AssignTicketScreenState extends State<AssignTicketScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AssignTicketsBloc>().add(
      const GetAllTicketsEvent(status: "Unassigned"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignTicketsBloc, AssignTicketsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            title: AppBarWidget(
              text: "ASSIGN TICKETS",
              isTrailing: true,
              trailing: SizedBox(
                height: 57.h,
                width: 250.h,
                child: CustomTextField<String>(
                  isTextField: false,
                  selectedValue: state.selectedStatus,
                  items: const ["Unassigned", "Assigned", "Relocate"],
                  onChanged: (value) {
                    if (value != null) {
                      context.read<AssignTicketsBloc>().add(
                        GetAllTicketsEvent(status: value),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: state.isGetTicketsLoading
                ? const Center(child: CircularProgressIndicator())
                : state.getTicketsResModel.isEmpty
                ? const Center(child: Text("No Assign Tickets"))
                : ResponsiveGridLayout(
                    itemCount: state.getTicketsResModel.length,
                    itemBuilder: (context, index) {
                      final model = state.getTicketsResModel[index];

                      return TicketCard(
                        onTap: () {
                          Get.toNamed(
                            PageRoutes.technicianAssignTicketScreen,
                            arguments: model.entryNo,
                          );
                        },
                        customerName: model.customerName,
                        mobileNumber: model.mobileNumber,
                        brand: model.company,
                        model: model.model,
                        status: model.finish, // 🔥 PASSED
                        technician: model.technician,
                        amount: model.estimateCost,
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
