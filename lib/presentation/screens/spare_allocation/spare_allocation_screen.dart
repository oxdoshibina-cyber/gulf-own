import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/presentation/screens/spare_allocation/widget/spare_data_card.dart';
import 'package:gulfownsalesview/presentation/screens/spare_allocation/widget/spare_data_dialog_box.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';

import '../../bloc/spare_allocation/spare_allocation_bloc.dart';

class SpareAllocationScreen extends StatefulWidget {
  const SpareAllocationScreen({super.key});

  @override
  State<SpareAllocationScreen> createState() => _SpareAllocationScreenState();
}

class _SpareAllocationScreenState extends State<SpareAllocationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<SpareAllocationBloc>().add(const GetSpareRequestListEvent());
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
        title: AppBarWidget(text: "SPARE ALLOCATION", isTrailing: false),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SpareAllocationBloc, SpareAllocationState>(
          builder: (context, state) {
            return state.isSpareListLoading
                ? const Center(child: CircularProgressIndicator())
                : state.spareRequestList.isEmpty
                ? Center(
              child: Text(
                "No spare allocation to display",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            )
              :ResponsiveGridLayout(
              itemCount: state.spareRequestList.length,
              itemBuilder: (context, index) {

                return SpareDataCard(
                  onTap: () {

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) =>
                          SpareDataDialogBox(
                            spareId: state.spareRequestList[index].si_entryno,
                            // technicianName: state.spareRequestList[index].Technician,
                            // deliveryDate: state.spareRequestList[index].si_deliverydate,
                            // customerName: state.spareRequestList[index].si_cust_name,
                            status: state.spareRequestList[index].spareStatus,
                            // brand: state.spareRequestList[index].si_company,
                            // model: state.spareRequestList[index].si_model,
                            // qty: "",
                            // total: '130.00',
                            // sparePartsName: 'Spare Parts Name',
                            // spareQty: '8',
                            // salesRate: '65.00',
                          ),
                    );
                  },
                  date: state.spareRequestList[index].si_deliverydate,
                  technicianName: state.spareRequestList[index].Technician,
                  mobileNumber: state.spareRequestList[index].scr_mobile_no,
                  empId: state.spareRequestList[index].si_assign_to.toString(),
                  status: state.spareRequestList[index].spareStatus,
                  customerName: state.spareRequestList[index].si_cust_name,
                  brand: state.spareRequestList[index].si_company,
                  model: state.spareRequestList[index].si_model,
                  // isMainStatus: true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
