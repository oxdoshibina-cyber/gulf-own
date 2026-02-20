import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/ticket_card.dart';
import 'package:gulfownsalesview/util/date_formatter.dart';
import '../../../core/theme/app_colors.dart';
import '../../router/page_routes.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/responsive_grid_layout.dart';

class TicketViewScreen extends StatefulWidget {
  const TicketViewScreen({super.key});

  @override
  State<TicketViewScreen> createState() => _TicketViewScreenState();
}

class _TicketViewScreenState extends State<TicketViewScreen> {
  @override
  void initState() {
    context.read<RegisterComplaintBloc>().add(
      const GetAllServiceComplaintEvent(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterComplaintBloc, RegisterComplaintState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            title: AppBarWidget(text: "ADD TICKETS", isTrailing: false),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(RegisterComplaintState state) {
    if (state.isComplaintLoading) {
      log(state.toString(), name: "current state");
      return const Center(child: CircularProgressIndicator());
    }

    if (state.isComplaintError) {
      return Center(
        child: Text(
          'Failed to load complaints.',
          style: AppTextStyle.kAmountTextStyle(),
        ),
      );
    }

    if (state.allServiceComplaints.isEmpty) {
      return Center(
        child: Text(
          'No complaints found.',
          style: AppTextStyle.kButtonTextStyle(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ResponsiveGridLayout(
        itemCount: state.allServiceComplaints.length,
        itemBuilder: (context, index) {
          final model = state.allServiceComplaints[index];
          return TicketViewCard(
            onTap: () {
              Get.toNamed(
                PageRoutes.addNewTicketScreen,
                arguments: {
                  'customerName': model.scrCustomerName,
                  'scrId': model.scrId,
                },
              );
            },
            tokenNumber: model.scrTokenNo.toString(),
            date: DateFormatter.formatDate(model.scrTokenDate),
            customerName: model.scrCustomerName,
            mobileNumber: model.scrMobileNo,
            address: model.scrCustomerAddress,
            customerFindings: model.scrFindings,
          );
        },
      ),
    );
  }
}
