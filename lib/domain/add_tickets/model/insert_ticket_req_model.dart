import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class InsertTicketReqModel extends Equatable {
  final String? customerName;
  final int? brandId;
  final String? modelNo;
  final String? imei;
  final String? batteryNo;
  final DateTime? expectedDate;
  final String? estimateCost;
  final double? advanceAmount;
  final int? cashPaidAccount;
  final int? categoryId;
  final String? couponNo;

  /// ✅ Accessories
  final List<String>? listItemsCollected;

  /// ✅ Lend items (UI friendly)
  final List<Map<String, dynamic>>? lendItems;

  /// ✅ API expects JSON string
  final String? lendItemsJson;

  /// ✅ Images
  final List<Uint8List>? images;

  const InsertTicketReqModel({
    this.customerName,
    this.brandId,
    this.modelNo,
    this.imei,
    this.batteryNo,
    this.expectedDate,
    this.estimateCost,
    this.advanceAmount,
    this.cashPaidAccount,
    this.categoryId,
    this.couponNo,
    this.listItemsCollected,
    this.lendItems,
    this.lendItemsJson,
    this.images,
  });

  /// ❌ Avoid using dummy() for real API calls
  factory InsertTicketReqModel.dummy() {
    return const InsertTicketReqModel(
      customerName: '',
      modelNo: '',
      imei: '',
      batteryNo: '',
      estimateCost: '',
      advanceAmount: 0,
      listItemsCollected: [],
      lendItems: [],
      images: [],
    );
  }

  /// --------------------------------------------------------------------------
  /// CONVERT TO FORM DATA (MULTIPART)
  /// --------------------------------------------------------------------------
  Future<FormData> toFormData() async {
    final formData = FormData();

    void addField(String key, dynamic value) {
      if (value != null && value.toString().isNotEmpty) {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    }

    addField('CustomerName', customerName);
    addField('BrandId', brandId);
    addField('ModelNo', modelNo);
    addField('IMEI', imei);
    addField('BatteryNo', batteryNo);
    addField('ExpectedDate', expectedDate?.toUtc().toIso8601String());
    addField('EstimateCost', estimateCost);
    addField('AdvanceAmount', advanceAmount);
    addField('CashPaidAccount', cashPaidAccount);
    addField('CategoryId', categoryId);
    addField('CouponNo', couponNo);

    /// ✅ Accessories array
    if (listItemsCollected != null && listItemsCollected!.isNotEmpty) {
      for (final item in listItemsCollected!) {
        formData.fields.add(MapEntry('list_itemscollected', item));
      }
    }

    /// ✅ LendItemsJson (priority)
    final resolvedLendItemsJson =
        lendItemsJson ??
        (lendItems != null && lendItems!.isNotEmpty
            ? jsonEncode(lendItems)
            : null);

    if (resolvedLendItemsJson != null && resolvedLendItemsJson.isNotEmpty) {
      formData.fields.add(MapEntry('LendItemsJson', resolvedLendItemsJson));
    }

    /// ✅ Images
    if (images != null && images!.isNotEmpty) {
      for (int i = 0; i < images!.length; i++) {
        formData.files.add(
          MapEntry(
            'Images',
            MultipartFile.fromBytes(
              images![i],
              filename: 'ticket_image_$i.png',
            ),
          ),
        );
      }
    }

    return formData;
  }

  @override
  List<Object?> get props => [
    customerName,
    brandId,
    modelNo,
    imei,
    batteryNo,
    expectedDate,
    estimateCost,
    advanceAmount,
    cashPaidAccount,
    categoryId,
    couponNo,
    listItemsCollected,
    lendItems,
    lendItemsJson,
    images,
  ];
}
