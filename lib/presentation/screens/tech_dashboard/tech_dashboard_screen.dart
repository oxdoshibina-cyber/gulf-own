import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gulfownsalesview/presentation/bloc/assign_tickets/assign_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/widget/tech_dash_card.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/util/date_formatter.dart';

import '../../../core/theme/app_colors.dart';
import '../../router/page_routes.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/responsive_grid_layout.dart';

class TechDashboardScreen extends StatefulWidget {
  const TechDashboardScreen({super.key});

  @override
  State<TechDashboardScreen> createState() => _TechDashboardScreenState();
}

class _TechDashboardScreenState extends State<TechDashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AssignTicketsBloc>().add(
      const GetAllTicketsEvent(status: "Assigned"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignTicketsBloc, AssignTicketsState>(
      builder: (context, state) {
        /// ✅ FILTERED LIST
        final filteredTickets = state.getTicketsResModel.where((ticket) {
          final query = state.technicianSearch.trim().toLowerCase();

          if (query.isEmpty) return true;

          return ticket.technician.toLowerCase().contains(query) ||
              ticket.customerName.toLowerCase().contains(query) ||
              ticket.mobileNumber.toLowerCase().contains(query);
        }).toList();

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            title: AppBarWidget(
              text: "TECHNICIAN DASHBOARD",
              isTrailing: true,
              trailing: SizedBox(
                width: 350.w,
                child: CustomTextField<String>(
                  isTextField: true,
                  hintText: "Search Technician",
                  onChanged: (value) {
                    context.read<AssignTicketsBloc>().add(
                      SearchTechnicianEvent(value ?? ""),
                    );
                  },
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.greyColor,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: state.isGetTicketsLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredTickets.isEmpty
                ? const Center(child: Text("No Assign Tickets"))
                : ResponsiveGridLayout(
                    itemCount: filteredTickets.length,
                    itemBuilder: (context, index) {
                      final model = filteredTickets[index];

                      return TechDashCard(
                        onTap: () {
                          Get.toNamed(
                            PageRoutes.sparePartsScreen,
                            arguments: model.entryNo,
                          );
                        },
                        customerName: model.customerName,
                        mobileNumber: model.mobileNumber,
                        brand: model.company,
                        model: model.model,
                        status: model.finish,
                        technician: model.technician,
                        amount: model.estimateCost,
                        assignDate: DateFormatter.formatDate(
                          model.assignedDate,
                        ),
                        deliveryDate: DateFormatter.formatDate(
                          model.deliveryDate,
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
