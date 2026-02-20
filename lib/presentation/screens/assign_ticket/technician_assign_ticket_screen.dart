import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/assign_tickets/assign_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/description_card.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/outline_card.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/widgets/technician_assign_ticket.dart';
import 'package:gulfownsalesview/presentation/widgets/app_bar_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_grid_layout.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';

class TechnicianAssignTicketScreen extends StatefulWidget {
  const TechnicianAssignTicketScreen({super.key});

  @override
  State<TechnicianAssignTicketScreen> createState() =>
      _TechnicianAssignTicketScreenState();
}

class _TechnicianAssignTicketScreenState
    extends State<TechnicianAssignTicketScreen> {
  int? ticketId;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments;

    if (args is int) {
      ticketId = args;

      context.read<AssignTicketsBloc>().add(
        GetTicketByIdEvent(id: GetTicketsByIdReqModel(id: ticketId!)),
      );
    } else {
      debugPrint("❌ TechnicianAssignTicketScreen opened without ticketId");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignTicketsBloc, AssignTicketsState>(
      builder: (context, state) {
        final model = state.getTicketsByIdResModel;

        /// ✅ FILTER TECHNICIANS BY SEARCH QUERY
        final filteredTechnicians = model.technicians.where((tech) {
          final query = state.technicianSearch;

          if (query.isEmpty) return true;

          return tech.name.toLowerCase().contains(query) ||
              tech.mobile.toLowerCase().contains(query);
        }).toList();

        /// 🔄 LOADING STATE
        if (state.isGetTicketsByIdLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: AppBarWidget(
              text: "TECHNICIAN ASSIGN TICKETS",
              isRow: true,
              isTrailing: true,

              /// ⬅️ BREADCRUMB
              subtitleWidget: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Navigator.of(context).canPop()) {
                        Get.back();
                      } else {
                        Get.offAllNamed(PageRoutes.mainPage, arguments: 2);
                      }
                    },

                    child: Row(
                      children: [
                        ResponsiveSvgIcon(
                          asset: SvgRes.backIcon,
                          size: 30.sp,
                          color: AppColors.textLightColor,
                        ),
                        AppSpacing.w16,
                        Text(
                          "ASSIGN TICKETS",
                          style: AppTextStyle.kLargeTextStyle(
                            fontColor: AppColors.textLightColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// 🔍 SEARCH TECHNICIAN
              trailing: SizedBox(
                width: 300.w,
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
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 📌 TICKET INFO CARD
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: OutLineCard(
                    customerName: model.ticket?.customerName ?? "",
                    mobileNumber: model.ticket?.mobileNumber ?? "",
                    brand: model.ticket?.company ?? "",
                    model: model.ticket?.model ?? "",
                    status: model.ticket?.finish ?? "",
                    technician: model.ticket?.technician ?? "",
                    cost: model.ticket?.estimateCost ?? "",
                  ),
                ),

                /// 📝 COMPLAINT LIST
                if (model.complaints.isNotEmpty) ...[
                  AppSpacing.h20,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: model.complaints.length,
                        separatorBuilder: (_, __) => AppSpacing.w12,
                        itemBuilder: (context, index) {
                          final complaint = model.complaints[index];
                          return DescriptionCard(
                            description: complaint.itemName,
                            remarks: complaint.remarks,
                            isDeleteIcon: false,
                          );
                        },
                      ),
                    ),
                  ),
                ],

                AppSpacing.h20,

                /// ❌ EMPTY STATE
                if (filteredTechnicians.isEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Text(
                        "No technicians found",
                        style: AppTextStyle.kTitleMediumTextStyle(
                          fontColor: AppColors.textLightColor,
                        ),
                      ),
                    ),
                  ),

                /// 🟢 TECHNICIAN GRID
                ResponsiveGridLayout(
                  itemCount: filteredTechnicians.length,
                  itemBuilder: (context, index) {
                    final technician = filteredTechnicians[index];
                    final isAssigned = model.ticket?.assignTo == technician.id;

                    return TechnicianAssignTicket(
                      technicianName: technician.name,
                      mobileNumber: technician.mobile,
                      workCount: technician.workCount.toString(),
                      status: technician.isActive==1? "ACTIVE" : "INACTIVE",
                      entryNo: model.ticket!.entryNo,
                      technicianId: technician.id,
                      isAssigned: isAssigned,
                    );
                  },
                ),

                AppSpacing.h20,
              ],
            ),
          ),
        );
      },
    );
  }
}
