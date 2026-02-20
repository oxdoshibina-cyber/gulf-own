import 'package:equatable/equatable.dart';

class InsertSpareReqModel extends Equatable {
  final int srId;
  final int srTicketNo;
  final int srItemId;
  final int srQty;
  final double srSRate;
  final double srDiscount;
  final double srsGross;
  final double srsNet;
  final double srsGst;
  final double srsTotal;
  final double uniqueCode;
  final int createdBy;

  const InsertSpareReqModel({
    required this.srId,
    required this.srTicketNo,
    required this.srItemId,
    required this.srQty,
    required this.srSRate,
    required this.srDiscount,
    required this.srsGross,
    required this.srsNet,
    required this.srsGst,
    required this.srsTotal,
    required this.uniqueCode,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
    srId,
    srTicketNo,
    srItemId,
    srQty,
    srSRate,
    srDiscount,
    srsGross,
    srsNet,
    srsGst,
    srsTotal,
    uniqueCode,
    createdBy,
  ];

  /// 🔥 API payload
  Map<String, dynamic> toMap() {
    return {
      "sr_id": srId,
      "sr_ticket_no": srTicketNo,
      "sr_item_id": srItemId,
      "sr_qty": srQty,
      "sr_srate": srSRate,
      "sr_discount": srDiscount,
      "sr_gross": srsGross,
      "sr_net": srsNet,
      "sr_gst": srsGst,
      "sr_total": srsTotal,
      'sr_unique_code': uniqueCode,
      "created_by": createdBy,
    };
  }

  /// 🔹 Dummy for Bloc initial state
  factory InsertSpareReqModel.dummy() {
    return const InsertSpareReqModel(
      srId: -1,
      srTicketNo: -1,
      srItemId: -1,
      srQty: 0,
      srSRate: 0,
      srDiscount: 0,
      srsGross: 0,
      srsNet: 0,
      srsGst: 0,
      srsTotal: 0,
      uniqueCode: -1,
      createdBy: -1,
    );
  }

  /// 🔁 copyWith
  InsertSpareReqModel copyWith({
    int? srId,
    int? srTicketNo,
    int? srItemId,
    int? srQty,
    double? srSRate,
    double? srDiscount,
    double? srsGross,
    double? srsNet,
    double? srsGst,
    double? srsTotal,
    double? uniqueCode,
    int? createdBy,
  }) {
    return InsertSpareReqModel(
      srId: srId ?? this.srId,
      srTicketNo: srTicketNo ?? this.srTicketNo,
      srItemId: srItemId ?? this.srItemId,
      srQty: srQty ?? this.srQty,
      srSRate: srSRate ?? this.srSRate,
      srDiscount: srDiscount ?? this.srDiscount,
      srsGross: srsGross ?? this.srsGross,
      srsNet: srsNet ?? this.srsNet,
      srsGst: srsGst ?? this.srsGst,
      srsTotal: srsTotal ?? this.srsTotal,
      uniqueCode: uniqueCode ?? this.uniqueCode,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
