import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/completed_works/widget/completed_works_card.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/date_selection_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';
import 'package:intl/intl.dart';

import '../../bloc/completed_work/completed_work_bloc.dart';
//
// class CompletedWorksScreen extends StatefulWidget {
//   const CompletedWorksScreen({super.key});
//
//   @override
//   State<CompletedWorksScreen> createState() => _CompletedWorksScreenState();
// }
//
// class _CompletedWorksScreenState extends State<CompletedWorksScreen> {
//   //   ValueNotifier<ResponseType> responseNotifier = ValueNotifier(
//   //   ResponseType.pending,
//   // );
//
//   final TextEditingController _searchController = TextEditingController();
//
//   DateTime? fromDate;
//   DateTime? toDate;
//
//   @override
//   void initState() {
//     super.initState();
//
//     context.read<CompletedWorkBloc>().add(
//       const GetCompletedWorkListEvent(
//         searchQuery: "", fromDate: '', toDate: '',
//       ),
//     );
//   }
//
//   /// FROM DATE PICKER
//   Future<void> _pickFromDate() async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: fromDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: toDate ?? DateTime.now(),
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         fromDate = pickedDate;
//
//         /// Reset toDate if it becomes invalid
//         if (toDate != null && toDate!.isBefore(fromDate!)) {
//           toDate = null;
//         }
//       });
//     }
//   }
//
//   /// TO DATE PICKER
//   Future<void> _pickToDate() async {
//     if (fromDate == null) {
//       Get.snackbar(
//         "Select From Date",
//         "Please select From Date first",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: toDate ?? fromDate!,
//       firstDate: fromDate!,
//       lastDate: DateTime.now(),
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         toDate = pickedDate;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         scrolledUnderElevation: 0.0,
//         backgroundColor: AppColors.backgroundColor,
//         elevation: 0,
//         title: AppBarWidget(text: "COMPLETED WORKS", isTrailing: false),
//       ),
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
//               child: Row(
//                 children: [
//                   /// 🔹 Date Picker Flexible Width
//                   Expanded(
//                     child: DateSelectionWidget(
//                       selectedFromDate: fromDate,
//                       selectedToDate: toDate,
//                       onFromDateTapped: _pickFromDate,
//                       onToDateTapped: _pickToDate,
//                     ),
//                   ),
//
//                   AppSpacing.w12,
//
//                   /// 🔹 Fully Responsive Search CustomTextField
//                   Expanded(
//                     child: ConstrainedBox(
//                       constraints: BoxConstraints(
//                         minWidth:
//                             50.w, // allows shrinking instead of fixed width
//                       ),
//                       child: CustomTextField(
//                         isTextField: true,
//                         fillColor: AppColors.backgroundColor,
//                         hintText: "Search Customer Name, Mob No.",
//                         suffixIcon: Icon(
//                           Icons.search,
//                           color: AppColors.greyColor,
//                           size: 22.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             ResponsiveGridLayout(
//               itemCount: 15,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return CompletedWorksCard(
//                   customerName: "Customer Name",
//                   mobileNumber: "9437488658",
//                   assignDate: '22-12-2025',
//                   deliveryDate: '23-12-2025',
//                   brand: 'Samsung',
//                   model: 'S23 Ultra',
//                   technician: 'Hrishilal',
//                   amount: '₹877',
//                   onTap: () {
//                     Get.toNamed(PageRoutes.completedWorkSecondScreen);
//                   },
//                   callOnTap: () {},
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CompletedWorksScreen extends StatefulWidget {
  const CompletedWorksScreen({super.key});

  @override
  State<CompletedWorksScreen> createState() => _CompletedWorksScreenState();
}

class _CompletedWorksScreenState extends State<CompletedWorksScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<CompletedWorkBloc>().add(
      const GetCompletedWorkListEvent(
        searchQuery: "", fromDate: '', toDate: '',
      ),
    );
  }



  void _fetchCompletedWorks() {
    final dateFormatter = DateFormat('yyyy-MM-dd');

    final String fromDt =
    fromDate != null ? dateFormatter.format(fromDate!) : '';

    final String toDt =
    toDate != null ? dateFormatter.format(toDate!) : '';

    log("fromDate  $fromDate");
    log("toDate  $toDate");

    context.read<CompletedWorkBloc>().add(
      GetCompletedWorkListEvent(
        fromDate: fromDt,
        toDate: toDt,
        searchQuery: _searchController.text.trim(),
      ),
    );
  }

  Future<void> _pickFromDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: toDate ?? DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        fromDate = picked;
        if (toDate != null && toDate!.isBefore(fromDate!)) {
          toDate = null;
        }
      });
      _fetchCompletedWorks();
    }
  }

  Future<void> _pickToDate() async {
    if (fromDate == null) return;

    final picked = await showDatePicker(
      context: context,
      initialDate: toDate ?? fromDate!,
      firstDate: fromDate!,
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => toDate = picked);
      _fetchCompletedWorks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const AppBarWidget(
          text: "COMPLETED WORKS",
          isTrailing: false,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: DateSelectionWidget(
                    selectedFromDate: fromDate,
                    selectedToDate: toDate,
                    onFromDateTapped: _pickFromDate,
                    onToDateTapped: _pickToDate,
                  ),
                ),
                AppSpacing.w12,
                Expanded(
                  child: CustomTextField(
                    controller: _searchController,
                    isTextField: true,
                    fillColor: AppColors.backgroundColor,
                    hintText: "Search Customer Name, Mob No.",
                    onChanged: (_) => _fetchCompletedWorks(),
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.greyColor,
                      size: 22.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 LIST SECTION
          Expanded(
            child: BlocBuilder<CompletedWorkBloc, CompletedWorkState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.isError) {
                  return const Center(child: Text("Something went wrong"));
                }

                if (state.completedWorkList.isEmpty) {
                  return const Center(child: Text("No completed works found"));
                }

                return ResponsiveGridLayout(
                  itemCount: state.completedWorkList.length,
                  itemBuilder: (context, index) {
                    final item = state.completedWorkList[index];

                    return CompletedWorksCard(
                      customerName: item.customerName,
                      mobileNumber: item.mobileNumber,
                      assignDate: DateFormat('dd-MM-yyyy').format(item.assignDate?? DateTime.now()),
                      deliveryDate: DateFormat('dd-MM-yyyy').format(item.DeliveryDate?? DateTime.now()),
                      brand: item.brand,
                      model: item.model,
                      technician: item.technicianName,
                      amount: item.estimatedCost,
                      onTap: () {
                        context.read<CompletedWorkBloc>().add(
                          GetCompletedWorkDetailsEvent(
                            workId: item.si_entryno!,
                          ),
                        );
                        Get.toNamed(PageRoutes.completedWorkSecondScreen, arguments: item.si_qtn_no,);
                      },
                      callOnTap: () {},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

