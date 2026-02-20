import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/add_customer/widget/add_customer_dialog_box.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';

import '../../bloc/register_complaint/register_complaint_bloc.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {

  @override
  void initState() {
    context.read<RegisterComplaintBloc>().add(
      const GetAllCustomersEvent(),
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
          text: "ADD CUSTOMER",
          isTrailing: true,
          trailing: SizedBox(
            width: 620.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 400.w,
                  // height: 55.h,
                  child: CustomTextField<String>(
                    isTextField: true,
                    hintText: 'Search',
                    onChanged: (value){
                      if(value != null){
                        context.read<RegisterComplaintBloc>().add(
                          SearchCustomerEvent(value),
                        );

                      }
                    },
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.greyColor,
                      size: 24.sp,
                    ),
                  ),
                ),
                AppSpacing.w10,
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ContainerButton(
                    height: 60.h,
                    width: 200.w,
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => AddCustomerDialogBox(),
                      );
                    },
                    radius: BorderRadius.circular(10.r),
                    alignment: Alignment.center,
                    text: "Add New Customer",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.w), 
          child: _CustomerTable()
      ),
    );
  },
);
  }
}

/// ----------------------------------------------------------------------
/// CUSTOMER TABLE WIDGET
/// ----------------------------------------------------------------------

class _CustomerTable extends StatelessWidget {
  final List<Map<String, dynamic>> customers = List.generate(20, (i) {
    return {
      "name": "Customer Name",
      "mobile": "98655566888",
      "email": "customer@gmail.com",
      "count": "7689",
      "address": "House Customer Perintalmanna",
    };
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterComplaintBloc, RegisterComplaintState>(
  builder: (context, state) {
    final filteredCustomers = state.allCustomersList.where((customer) {
      final query = state.customerSearch.trim();

      if (query.isEmpty) return true;

      final q = query.toLowerCase();

      return customer.scrCustomerName.toLowerCase().contains(q) ||
          customer.scrMobileNo.toLowerCase().contains(q) ||
          customer.scrEmail.toLowerCase().contains(q) ||
          customer.scrTokenNo.toString().toLowerCase().contains(q) ||
          customer.scrCustomerAddress.toLowerCase().contains(q);
    }).toList();

    if (filteredCustomers.isEmpty) {
      return Center(
        child: Text(
          'No customers found.',
          style: AppTextStyle.kButtonTextStyle(),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          /// HEADER + PAGINATION ROW
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Customer List",
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                /// >>>>>>> REFACTORED PAGINATION <<<<<<<<
                // PaginationWidget(
                //   currentPage: 3,
                //   totalPages: 10,
                //   onPageChanged: (p) {},
                // ),
              ],
            ),
          ),

          AppSpacing.h12,

          /// HEADER TITLES
          Row(
            children: const [
              _HeaderCell("Name"),
              _HeaderCell("Mobile"),
              _HeaderCell("Email"),
              _HeaderCell("Count No"),
              _HeaderCell("Address"),
            ],
          ),
          Divider(thickness: 1.h),

          /// TABLE CONTENT
          Expanded(
            child: state.isComplaintLoading ?
            const Center(child: CircularProgressIndicator())
            : state.isComplaintError ?
            Center(
              child: Text(
                'Failed to load customers.',
                style: AppTextStyle.kAmountTextStyle(),
              ),
            )
            : filteredCustomers.isEmpty ?
            Center(
              child: Text(
                'No customers found.',
                style: AppTextStyle.kButtonTextStyle(),
              ),
            )
            :ListView.builder(
              itemCount: filteredCustomers.length,
              itemBuilder: (_, index) {
                final c = filteredCustomers[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _DataCell(c.scrCustomerName,280.w),
                    _DataCell(c.scrMobileNo,200.w),
                    _DataCell(c.scrEmail,280.w),
                    _DataCell(c.scrTokenNo.toString(),140.w),
                    _DataCell(c.scrCustomerAddress,280.w),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 14.h),
        ],
      ),
    );
  },
);
  }
}

/// ----------------------------------------------------------------------
/// HEADER CELL
/// ----------------------------------------------------------------------
class _HeaderCell extends StatelessWidget {
  final String title;
  const _HeaderCell(this.title);

  double _responsiveFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1200) return 16.sp; // Desktop
    if (width >= 800) return 14.sp; // Tablet
    return 10.sp; // Mobile
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: title == 'Mobile'? 200.w: title == 'Count No'? 140.w :280.w,

      color: AppColors.backgroundColor,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.kTitleMediumTextStyle(
          fontWeight: FontWeight.w600,
          fontSize: _responsiveFontSize(context),
          fontColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}

/// ----------------------------------------------------------------------
/// DATA CELL
/// ----------------------------------------------------------------------
class _DataCell extends StatelessWidget {
  final String data;
  final double width;
  const _DataCell(this.data, this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  width,

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w ),
        child: Text(data,
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
            style: AppTextStyle.kTitleMediumTextStyle()),
      ),
    );
  }
}

/// ----------------------------------------------------------------------
/// PAGINATION WIDGET (EXACT FIGMA STYLE)
/// ----------------------------------------------------------------------

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _arrowButton(
          Icons.chevron_left,
          currentPage > 1
              ? () {
                  onPageChanged(currentPage - 1);
                }
              : null,
        ),

        SizedBox(width: 8.w),

        ..._buildPageButtons(),

        SizedBox(width: 8.w),

        _arrowButton(
          Icons.chevron_right,
          currentPage < totalPages
              ? () {
                  onPageChanged(currentPage + 1);
                }
              : null,
        ),
      ],
    );
  }

  List<Widget> _buildPageButtons() {
    List<Widget> buttons = [];

    buttons.add(_pageButton(1)); // first page

    if (currentPage > 3) buttons.add(_dots());

    for (int i = currentPage - 1; i <= currentPage + 1; i++) {
      if (i > 1 && i < totalPages) {
        buttons.add(_pageButton(i));
      }
    }

    if (currentPage < totalPages - 2) buttons.add(_dots());

    if (totalPages > 1) buttons.add(_pageButton(totalPages));

    return buttons;
  }

  Widget _pageButton(int page) {
    bool isSelected = page == currentPage;

    return GestureDetector(
      onTap: () => onPageChanged(page),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        width: 32.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Text(
          page.toString(),
          style: TextStyle(
            fontSize: 14.sp,
            color: isSelected ? AppColors.whiteColor : AppColors.textLightColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, size: 20.sp, color: AppColors.textLightColor),
      ),
    );
  }

  Widget _dots() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Text(
        "...",
        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
      ),
    );
  }
}
