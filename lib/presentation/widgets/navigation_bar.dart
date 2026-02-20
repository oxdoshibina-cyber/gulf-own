import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/add_customer/add_customer_screen.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/add_ticket_screen.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/assign_ticket_screen.dart';
import 'package:gulfownsalesview/presentation/screens/completed_works/completed_works_screen.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/customer_enquiry_screen.dart';
import 'package:gulfownsalesview/presentation/screens/delivery/delivery_screen.dart';
import 'package:gulfownsalesview/presentation/screens/items_collected.dart/items_collected_screen.dart';
import 'package:gulfownsalesview/presentation/screens/qc_checklist/qc_checklist_screen.dart';
import 'package:gulfownsalesview/presentation/screens/quality_check/quality_check.dart';
import 'package:gulfownsalesview/presentation/screens/register_complaint/register_complaint_screen.dart';
import 'package:gulfownsalesview/presentation/screens/spare_allocation/spare_allocation_screen.dart';
import 'package:gulfownsalesview/presentation/screens/tech_dashboard/tech_dashboard_screen.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';

import '../screens/add_ticket/ticket_view_screen.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  late final ValueNotifier<int> selectedIndexNotifier;

  @override
  void initState() {
    super.initState();

    /// ✅ Read index from GetX arguments
    final int initialIndex = Get.arguments ?? 0;

    selectedIndexNotifier = ValueNotifier<int>(initialIndex);
  }

  @override
  void dispose() {
    selectedIndexNotifier.dispose();
    super.dispose();
  }

  final List<String> menuTitles = [
    'Register Complaint',
    'Add Tickets',
    'Assign Tickets',
    'Tech Dashboard',
    'Quality Check',
    'QC Check List',
    'Delivery',
    'Add Customer',
    'Spare Allocation',
    'Items Collected',
    'Completed Works',
    'Customer Enquiry',
  ];

  final List<Widget> screens = [
    RegisterComplaintScreen(),
    TicketViewScreen(),
    AssignTicketScreen(),
    TechDashboardScreen(),
    QualityCheck(),
    QcChecklistScreen(),
    DeliveryScreen(),
    AddCustomerScreen(),
    SpareAllocationScreen(),
    ItemsCollectedScreen(),
    CompletedWorksScreen(),
    CustomerEnquiryScreen(),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 300.w,
            color: AppColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.h40,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Image.asset(ImageRes.logo, height: 76.h, width: 76.w),
                ),
                AppSpacing.h20,

                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: selectedIndexNotifier,
                    builder: (context, selectedIndex, _) {
                      return ListView.builder(
                        itemCount: menuTitles.length,
                        itemBuilder: (context, i) {
                          final bool isSelected = selectedIndex == i; // FIXED

                          return _buildMenuItem(
                            iconWidget: _getMenuIcon(i, isSelected),
                            label: menuTitles[i],
                            isSelected: isSelected,
                            onTap: () => selectedIndexNotifier.value = i,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Right Panel
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndexNotifier,
              builder: (context, selectedIndex, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: screens[selectedIndex],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Sidebar Tile
  Widget _buildMenuItem({
    required Widget iconWidget,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isSelected ? AppColors.redColor : Colors.transparent,
          ),
          child: Row(
            children: [
              iconWidget,
              AppSpacing.w12,
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyle.kTitleMediumTextStyle(
                    fontSize: 16.sp,
                    fontColor: isSelected
                        ? AppColors.whiteColor
                        : AppColors.whiteLightColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Return Responsive Icon Widget
  Widget _getMenuIcon(int index, bool isSelected) {
    final Color iconColor = isSelected
        ? AppColors.whiteColor
        : AppColors.whiteLightColor;

    switch (index) {
      case 0:
        return ResponsiveSvgIcon(
          asset: SvgRes.registerComplaint,
          color: iconColor,
        );
      case 1:
        return ResponsiveSvgIcon(asset: SvgRes.addTickets, color: iconColor);
      case 2:
        return ResponsiveSvgIcon(asset: SvgRes.assignTickets, color: iconColor);
      case 3:
        return ResponsiveSvgIcon(asset: SvgRes.techDashboard, color: iconColor);
      case 4:
        return ResponsiveSvgIcon(asset: SvgRes.qualityCheck, color: iconColor);
      case 5:
        return ResponsiveSvgIcon(
          asset: SvgRes.qcCheckListIcon,
          color: iconColor,
        );
      case 6:
        return ResponsiveSvgIcon(asset: SvgRes.delivery, color: iconColor);
      case 7:
        return ResponsiveSvgIcon(asset: SvgRes.addCustomer, color: iconColor);
      case 8:
        return ResponsiveSvgIcon(asset: SvgRes.spareIcon, color: iconColor);
      case 9:
        return ResponsiveSvgIcon(
          asset: SvgRes.itemsCollectedIcon,
          color: iconColor,
        );
      case 10:
        return ResponsiveSvgIcon(
          asset: SvgRes.completedWorksIcon,
          color: iconColor,
        );
      default:
        return ResponsiveSvgIcon(
          asset: SvgRes.customerEnquiryIcon,
          color: iconColor,
        );
    }
  }
}
