import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/assets/asset_resources.dart';
import '../../../core/enum/job_status.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/responsive_grid_layout.dart';
import '../../widgets/responsive_svg_icon.dart';

class FinalSettlementScreen extends StatefulWidget {
  const FinalSettlementScreen({super.key});

  @override
  State<FinalSettlementScreen> createState() => _FinalSettlementScreenState();
}

class _FinalSettlementScreenState extends State<FinalSettlementScreen> {
  JobStatus selectedStatus = JobStatus.inProgress;
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
          text: "FINAL SETTLEMENT",
          isTrailing: true,
          isRow: true,
          subtitleWidget: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    ResponsiveSvgIcon(
                      asset: SvgRes.backIcon,
                      color: AppColors.textLightColor,
                      size: 30.sp,
                    ),
                    AppSpacing.w16,
                    Text(
                      "DELIVERY",
                      style: AppTextStyle.kLargeTextStyle(
                        fontColor: AppColors.textLightColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.w36,
              ResponsiveSvgIcon(asset: SvgRes.backIcon, size: 30.sp),
              AppSpacing.w16,
              Text(
                "FINAL SETTLEMENT",
                style: AppTextStyle.kLargeTextStyle(),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => showGClaimPopup(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "You Add \"G\" claim",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// CUSTOMER INFO CARD
              Container(
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      spacing: 150.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoTile(
                          "Customer Name",
                          "+91 897654544",
                          titleBlue: true,
                        ),
                        infoTile("Brand", "Samsung"),
                        infoTile("Model", "S23 Ultra"),
                        infoTile("Status", "Unassigned", valueRed: true),
                        infoTile("Technician", "Name"),
                        Spacer(),
                        infoTile("Estimate Cost", "₹877", valueGreen: true),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// REASON TEXT
              Text(
                "The Reason Is Display Complaint And Battery Backup Issue",
                style: TextStyle(fontSize: 14.sp, color: Colors.redAccent),
              ),

              SizedBox(height: 20.h),

              /// DESCRIPTION BOXES
              Row(
                children: [
                  Expanded(child: descriptionBox()),
                  SizedBox(width: 20.w),
                  Expanded(child: descriptionBox()),
                ],
              ),

              SizedBox(height: 25.h),

              /// SPARE PART CARDS
              ResponsiveGridLayout(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return spareCard(status: "Approved", approved: true);
                },
              ),

              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, -1),
            ),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// -------------------------
            /// TOP ROW – AMOUNT BOXES
            /// -------------------------
            Row(
              spacing: 15.w,
              children: [
                amountBox("Service  Charge", "0.00"),
                amountBoxFilled("Total Charges", "0.00"),
                amountBox("Other Discount", "0.00"),
                amountBox("Other Charge", "0.00"),
                amountBoxFilled("Grand Total", "0.00"),
                amountBoxFilled("Advn Received", "0.00"),
                amountBoxFilled("Balance", "0.00"),
              ],
            ),

            SizedBox(height: 18.h),

            /// -------------------------
            /// SECOND ROW – INPUTS & BUTTONS
            /// -------------------------
            Row(
              spacing: 15.w,
              children: [
                amountBox("Cash Received", "0.00"),
                accountDropdown(),
                amountBox("Card Received", "0.00"),
                accountDropdown(),
                /// Narration Textfield
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 80.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Narration",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                /// SUBMIT BUTTON
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 80.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xff002866),   // button color
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),

    );
  }
  Widget amountBox(String label, String value) {
    return Expanded(
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xff2BB673)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
            ),
            SizedBox(height: 3.h),
            Text(
              value,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget amountBoxFilled(String label, String value) {
    return Expanded(
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xffF3F5FA),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
            ),
            SizedBox(height: 3.h),
            Text(
              value,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget accountDropdown() {
    return Expanded(
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("Choose Acc", style: TextStyle(fontSize: 14.sp)),
            items: [
              DropdownMenuItem(value: "Acc1", child: Text("Acc1")),
              DropdownMenuItem(value: "Acc2", child: Text("Acc2")),
            ],
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }

  /// status chip
  Widget statusButton({
    required JobStatus status,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    // Colors for selected states
    Color selectedColor(JobStatus s) {
      switch (s) {
        case JobStatus.inProgress:
          return const Color(0xff4A73C0); // Blue
        case JobStatus.completed:
          return const Color(0xff2E9E4D); // Green
        case JobStatus.hold:
          return const Color(0xffCDB926); // Yellow
        case JobStatus.dead:
          return const Color(0xffD64545); // Red
      }
    }

    // Text Label
    String title(JobStatus s) {
      switch (s) {
        case JobStatus.inProgress:
          return "In Progress";
        case JobStatus.completed:
          return "Completed";
        case JobStatus.hold:
          return "Hold";
        case JobStatus.dead:
          return "Dead";
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor(status) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade400,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            if (isSelected)
              Icon(Icons.check_box, color: Colors.white, size: 18.sp),
            if (isSelected) SizedBox(width: 6.w),
            Text(
              title(status),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SMALL WIDGET FUNCTIONS
  Widget infoTile(
    String title,
    String value, {
    bool valueRed = false,
    bool titleRed = false,
    bool titleBlue = false,
    bool valueGreen = false,
  }) {
    return Column(
      crossAxisAlignment: valueGreen
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            color: titleBlue
                ? Color(0xff002660)
                : titleRed
                ? Colors.redAccent
                : Colors.grey[600],
            fontWeight: titleBlue || titleRed
                ? FontWeight.w800
                : FontWeight.normal,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: valueRed
                ? Colors.redAccent
                : valueGreen
                ? Colors.green
                : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget descriptionBox() {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.h),
          Text(
            "Remarks",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget spareCard({required String status, required bool approved}) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            "Spare Parts Name",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff0A2A52),
            ),
          ),

          SizedBox(height: 6.h),

          /// Status (Approved)
          Text(
            status,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: approved ? Colors.green : Colors.red,
            ),
          ),

          SizedBox(height: 22.h),

          /// ROWS AREA (Qty / Sale Rate)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCol("Qty", "8"),
              textCol("Sale Rate", "65.00", green: true, end: true),
            ],
          ),
          SizedBox(height: 14.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCol("Gross", "12.00"),
              textCol("Discount", "5.00", red: true, end: true),
            ],
          ),
          SizedBox(height: 14.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCol("Net", "12.00"),
              textCol("GST", "5.00", end: true),
            ],
          ),

          SizedBox(height: 16.h),

          Divider(color: Colors.grey.shade300, thickness: 1),

          SizedBox(height: 12.h),

          /// TOTAL SECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "₹877",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------------------------
  /// TEXT COLUMN STYLE
  /// ---------------------------
  Widget textCol(
    String title,
    String value, {
    bool green = false,
    bool red = false,
    bool end = false,
  }) {
    return Column(
      crossAxisAlignment: end
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: green
                ? Colors.green
                : red
                ? Colors.red
                : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget checkBtn(String text, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: selected ? Colors.blue : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_box,
            size: 20.sp,
            color: selected ? Colors.blue : Colors.grey.shade400,
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: selected ? Colors.blue : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  void showHoldDialog(BuildContext context) {
    TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: SizedBox(
            width: 330.w, // 🔥 reduced width (adjust as you like)
            child: Container(
              padding: EdgeInsets.all(22.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    "Hold It",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  /// SUBTITLE
                  Text(
                    "Are you sure you want Hold it?",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),

                  SizedBox(height: 20.h),

                  /// TEXT FIELD
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "enter reason",
                      hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      contentPadding: EdgeInsets.all(16.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),

                  SizedBox(height: 25.h),

                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2,
                            shadowColor: Colors.grey.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffD64545),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                          ),
                          child: Text(
                            "Hold",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ///relocated

  void showRelocateChoicePopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: 500.w,
            padding: EdgeInsets.all(22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Relocate",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 22.sp, color: Colors.grey),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                Text(
                  "Are you sure you want to assign Admin or Technician",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),

                SizedBox(height: 22.h),

                Row(
                  children: [
                    Expanded(
                      child: relocateOption(
                        title: "Admin",
                        onTap: () {
                          Navigator.pop(context);
                          showAdminRelocatePopup(context);
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: relocateOption(
                        title: "Technician",
                        onTap: () {
                          Navigator.pop(context);
                          showTechnicianRelocatePopup(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget relocateOption({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }

  void showTechnicianRelocatePopup(BuildContext context) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: 340.w,
            padding: EdgeInsets.all(22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Technician Relocate",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  "Are you sure you want Relocate?",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),

                SizedBox(height: 20.h),

                TextField(
                  controller: controller,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "enter reason",
                    contentPadding: EdgeInsets.all(16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 2,
                          shadowColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: technician relocate
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff001E4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showAdminRelocatePopup(BuildContext context) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: 340.w,
            padding: EdgeInsets.all(22.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Admin Relocate",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  "Are you sure you want Relocate?",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),

                SizedBox(height: 20.h),

                TextField(
                  controller: controller,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "enter reason",
                    contentPadding: EdgeInsets.all(16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 2,
                          shadowColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: admin relocate
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff001E4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showRequestSparePopup(BuildContext context) {
    TextEditingController qty = TextEditingController();
    TextEditingController rate = TextEditingController();
    TextEditingController discount = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: 800.w,
            padding: EdgeInsets.all(22.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE + CLOSE BTN
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Request Spare",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        size: 22.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18.h),

                /// LABEL
                Text(
                  "Spare parts",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),

                SizedBox(height: 8.h),

                /// DROPDOWN + EYE BUTTON
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => showSparePartsListPopup(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select Spare",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey.shade700,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    /// EYE ICON
                    GestureDetector(
                      onTap: () => showSpareHistoryPopup(context),
                      child: Container(
                        height: 60.h,
                        width: 60.h,
                        decoration: BoxDecoration(
                          color: Color(0xff002660).withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: SvgPicture.asset(
                          SvgRes.eyeIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 22.h),

                /// 3 INPUT ROW (QTY, RATE, DISCOUNT)
                Row(
                  children: [
                    Expanded(child: spareInput("Qty")),
                    SizedBox(width: 12.w),
                    Expanded(child: spareInput("S Rate")),
                    SizedBox(width: 12.w),
                    Expanded(child: spareInput("Discount")),
                  ],
                ),

                SizedBox(height: 18.h),

                /// DATA SUMMARY ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 50.w,
                  children: [
                    summaryCol("Qty", "0.00"),
                    summaryCol("Sale Rate", "0.00"),
                    summaryCol("Gross", "0.00"),
                    summaryCol("Net", "0.00"),
                    summaryCol("GST", "0.00"),
                    summaryCol("Total", "0.00", green: true),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w,
                          vertical: 14.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 22.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget spareInput(String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          hint,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget summaryCol(String label, String value, {bool green = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: green ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }

  void showSparePartsListPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: 650.w,
            padding: EdgeInsets.all(22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spare Parts List",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close),
                    ),
                  ],
                ),

                SizedBox(height: 18.h),

                /// SEARCH
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Search Spare Parts",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                SizedBox(
                  height: 340.h,
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: Text(
                          "Spare Parts",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSpareHistoryPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: 650.w,
            padding: EdgeInsets.all(22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spare Parts History",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                SizedBox(
                  height: 350.h,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 14.h),
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Spare Name",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff0A2A52),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "Customer Name",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  "12-10-2025",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "454.00",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showGClaimPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),

      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topRight, // 👈 show at top right
          child: Padding(
            padding: const EdgeInsets.only(top: 80, right: 20), // adjust position
            child: Material(
              color: Colors.transparent,
              child: _gClaimCard(context),
            ),
          ),
        );
      },

      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.2, -0.2), // slide from slight right-top
            end: Offset.zero,
          ).animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  Widget _gClaimCard(BuildContext context) {
    return Container(
      width: 400.w,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          const Text(
            'You Add “G” claim ?',
            style: TextStyle(
              color: Color(0xff002866),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          /// INPUT BOX
          TextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: "Enter amount",
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff002866),
                  width: 1.5,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 22),

          /// BUTTONS ROW
          Row(
            children: [
              /// CANCEL BUTTON
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// CONFIRM BUTTON
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xff002866),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
