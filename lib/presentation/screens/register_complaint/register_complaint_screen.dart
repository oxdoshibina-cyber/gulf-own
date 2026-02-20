import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/screens/register_complaint/widget/complaint_card.dart';
import 'package:gulfownsalesview/presentation/screens/register_complaint/widget/register_complaint_mobile_dialog_box.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';
import 'package:gulfownsalesview/util/date_formatter.dart';

class RegisterComplaintScreen extends StatefulWidget {
  const RegisterComplaintScreen({super.key});

  @override
  State<RegisterComplaintScreen> createState() =>
      _RegisterComplaintScreenState();
}

class _RegisterComplaintScreenState extends State<RegisterComplaintScreen> {
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
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0.0,
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            title: AppBarWidget(
              text: "REGISTER COMPLAINT",
              isTrailing: true,
              trailing: FittedBox(
                fit: BoxFit.scaleDown,
                child: ContainerButton(
                  height: 56.h,
                  width: 200.w,
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => RegisterComplaintMobileDialogBox(),
                    );
                  },
                  radius: BorderRadius.circular(10.r),
                  alignment: Alignment.center,
                  text: "Register Complaint",
                ),
              ),
            ),
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
          return ComplaintCard(
            onTap: () {},
            tokenNumber: '#${model.scrTokenNo}',
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
