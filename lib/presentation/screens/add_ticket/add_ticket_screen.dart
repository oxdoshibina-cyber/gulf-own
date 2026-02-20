import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_description_list_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_brand_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_card_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_cash_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_req_model.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/presentation/bloc/add_tickets/add_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/items_collected/items_collected_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/image_detail_page.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/ticket_detail_widget.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';

class AddTicketScreen extends StatefulWidget {
  const AddTicketScreen({super.key});

  @override
  State<AddTicketScreen> createState() => _AddTicketScreenState();
}

class _AddTicketScreenState extends State<AddTicketScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier(0);

  final _modelNoController = TextEditingController();
  final _imeiController = TextEditingController();
  final _batteryNoController = TextEditingController();
  final _estimateCostController = TextEditingController();
  final _advanceAmountController = TextEditingController();
  final _bankAmountController = TextEditingController();
  final _remarksController = TextEditingController();
  final _customerController = TextEditingController();
  final _cashAmountController = TextEditingController();

  final _brandNameNotifier = ValueNotifier<GetServiceBrandModel?>(null);
  final _cashAccountNotifier = ValueNotifier<GetServiceCashModel?>(null);
  final _bankAccountNotifier = ValueNotifier<GetServiceCardModel?>(null);
  final _categoryNotifier = ValueNotifier<GetServiceCategory?>(null);
  final _descriptionNotifier = ValueNotifier<GetDescriptionListModel?>(null);
  final ValueNotifier<List<AddedDescriptionItem>> _addedDescriptionsNotifier =
      ValueNotifier<List<AddedDescriptionItem>>([]);

  final ValueNotifier<DateTime?> _expectedDeliveryDateNotifier =
      ValueNotifier<DateTime?>(null);

  final ValueNotifier<List<String>> _selectedAccessories =
      ValueNotifier<List<String>>([]);
  final ValueNotifier<List<Uint8List?>> _imagesNotifier =
      ValueNotifier<List<Uint8List?>>(List.filled(6, null));
  int? _scrId;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments;
    if (args != null && args is Map) {
      _customerController.text = args['customerName'] ?? '';
      _scrId = args['scrId']; // ✅ capture scrId
    }

    context.read<AddTicketsBloc>().add(const GetServiceBrandEvent());
    context.read<AddTicketsBloc>().add(const GetServiceCashEvent());
    context.read<AddTicketsBloc>().add(const GetServiceCardEvent());
    context.read<RegisterComplaintBloc>().add(const GetServiceCategoryEvent());
    context.read<ItemsCollectedBloc>().add(const GetItemsCollectedEvent());
    context.read<AddTicketsBloc>().add(const GetDescriptionListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTicketsBloc, AddTicketsState>(
      listenWhen: (previous, current) {
        return previous.isInsertTicketLoading !=
                current.isInsertTicketLoading ||
            previous.isInsertTicketSuccess != current.isInsertTicketSuccess ||
            previous.isInsertTicketError != current.isInsertTicketError;
      },
      listener: (context, state) {
        final messenger = ScaffoldMessenger.of(context);
        // Show loading snackbar
        if (state.isInsertTicketLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(width: 10),
                  Text('Creating ticket...'),
                ],
              ),
              duration: Duration(seconds: 30), // Long duration for loading
            ),
          );
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Row(
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(width: 10),
                    Text('Creating ticket...'),
                  ],
                ),
                duration: Duration(days: 1),
              ),
            );
        }

        // Listen for insert ticket success
        if (state.isInsertTicketSuccess) {
          messenger.hideCurrentSnackBar();

          messenger.showSnackBar(
            const SnackBar(
              content: Text('Ticket created successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          context.read<AddTicketsBloc>().add(const ResetInsertTicketEvent());
          // Navigate after successful insertion
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offAllNamed(PageRoutes.mainPage, arguments: 2);
          });
        }

        // Show error message
        if (state.isInsertTicketError) {
          // Dismiss loading snackbar
          messenger.hideCurrentSnackBar();

          // Show error message with more details
          messenger.showSnackBar(
            const SnackBar(
              content: Text('Failed to create ticket. Please try again.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
          context.read<AddTicketsBloc>().add(const ResetInsertTicketEvent());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: _buildBreadcrumb(),
          ),
          body: Center(
            child: ValueListenableBuilder(
              valueListenable: _currentPageNotifier,
              builder: (context, currentPage, _) {
                return PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) {
                    _currentPageNotifier.value = page;
                  },
                  children: [
                    TicketDetailWidget(
                      pageController: _pageController,
                      currentPage: currentPage,
                      onSubmit: _onSubmit,
                      modelNoController: _modelNoController,
                      imeiController: _imeiController,
                      batteryNoController: _batteryNoController,
                      estimateCostController: _estimateCostController,
                      advanceAmountController: _advanceAmountController,
                      remarksController: _remarksController,
                      customerController: _customerController,
                      brandNameNotifier: _brandNameNotifier,
                      cashAccountNotifier: _cashAccountNotifier,
                      categoryNotifier: _categoryNotifier,
                      descriptionNotifier: _descriptionNotifier,
                      expectedDeliveryDateNotifier:
                          _expectedDeliveryDateNotifier,
                      onPickDate: _pickDate,
                      selectedAccessoriesNotifier: _selectedAccessories,
                      bankAmountController: _bankAmountController,
                      bankAccountNotifier: _bankAccountNotifier,
                      cashAmountController: _cashAmountController,
                      addedDescriptionsNotifier: _addedDescriptionsNotifier,
                    ),
                    ImageDetailPage(
                      pageController: _pageController,
                      currentPage: currentPage,
                      onSubmit: _onSubmit,
                      imagesNotifier: _imagesNotifier,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildBreadcrumb() {
    final isTicketPage = _currentPageNotifier.value == 0;

    TextStyle crumbStyle(bool isActive) => AppTextStyle.kPageHeadingTextStyle(
      fontColor: isActive ? AppColors.darkColor : AppColors.greyColor,
      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
    );

    return Row(
      children: [
        GestureDetector(
          onTap: Get.back,
          child: ResponsiveSvgIcon(asset: SvgRes.backIcon, size: 40.sp),
        ),
        AppSpacing.w10,
        Text('TICKETS', style: crumbStyle(isTicketPage)),
        AppSpacing.w8,
        Icon(
          Icons.arrow_back_ios,
          size: 12.sp,
          color: AppColors.greyColor,
        ), // divider chevron
        AppSpacing.w8,
        Text('IMAGES', style: crumbStyle(!isTicketPage)),
      ],
    );
  }

  Future<void> _onSubmit() async {
    /// 🔹 PAGE 0 → JUST MOVE TO IMAGES
    if (_currentPageNotifier.value == 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    /// 🔹 PAGE 1 → SUBMIT TICKET
    final lendItemsJson = _addedDescriptionsNotifier.value
        .map((e) => {"li_ir_id": e.irId, "li_remarks": e.remarks})
        .toList();

    final images = _imagesNotifier.value.whereType<Uint8List>().toList();

    log('🟡 Creating InsertTicketReqModel...'); // Add this
    log('🟡 Customer Name: ${_customerController.text.trim()}');
    log('🟡 Brand ID: ${_brandNameNotifier.value?.companyId}');
    log('🟡 Category ID: ${_categoryNotifier.value?.cId}');

    // Add debug logs for critical fields
    log('🟡 Cash Account: ${_cashAccountNotifier.value?.id}');
    log('🟡 Bank Account: ${_bankAccountNotifier.value?.id}');
    log('🟡 Images count: ${images.length}');
    log('🟡 Selected Accessories: ${_selectedAccessories.value}');
    log('🟡 Added Descriptions: ${_addedDescriptionsNotifier.value.length}');
    log('🟡 Coupon: ${_addedDescriptionsNotifier.value.length}');

    final req = InsertTicketReqModel(
      customerName: _customerController.text.trim(),
      brandId: _brandNameNotifier.value?.companyId,
      modelNo: _modelNoController.text.trim(),
      imei: _imeiController.text.trim(),
      batteryNo: _batteryNoController.text.trim(),
      expectedDate: _expectedDeliveryDateNotifier.value,
      estimateCost: _estimateCostController.text.trim(),
      advanceAmount: double.tryParse(_advanceAmountController.text) ?? 0,
      cashPaidAccount: _cashAccountNotifier.value?.id,
      categoryId: _categoryNotifier.value?.cId,
      listItemsCollected: _selectedAccessories.value,
      lendItems: lendItemsJson,
      images: images,
      couponNo: _scrId?.toString(),
    );

    log('🟡 Dispatching InsertTicketEvent...');
    context.read<AddTicketsBloc>().add(
      InsertTicketEvent(insertTicketReqModel: req),
    );
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _expectedDeliveryDateNotifier.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      _expectedDeliveryDateNotifier.value = date;
    }
  }
}
