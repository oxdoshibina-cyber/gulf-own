import 'package:equatable/equatable.dart';

class InsertSpareResModel extends Equatable {
  final int srId;
  final int srTicketNo;
  final int srItemId;
  final int srQty;
  final double srSRate;
  final double srDiscount;
  final double srGross;
  final double srNet;
  final double srGst;
  final double srTotal;
  final String srStatus;
  final double uniqueCode;
  final int createdBy;
  final String createdDate;
  final int updatedBy;
  final String updatedDate;

  const InsertSpareResModel({
    required this.srId,
    required this.srTicketNo,
    required this.srItemId,
    required this.srQty,
    required this.srSRate,
    required this.srDiscount,
    required this.srGross,
    required this.srNet,
    required this.srGst,
    required this.srTotal,
    required this.srStatus,
    required this.uniqueCode,
    required this.createdBy,
    required this.createdDate,
    required this.updatedBy,
    required this.updatedDate,
  });

  factory InsertSpareResModel.dummy() {
    return const InsertSpareResModel(
      srId: -1,
      srTicketNo: 0,
      srItemId: 0,
      srQty: 0,
      srSRate: 0,
      srDiscount: 0,
      srGross: 0,
      srNet: 0,
      srGst: 0,
      srTotal: 0,
      srStatus: '',
      uniqueCode: 0.0,
      createdBy: -1,
      createdDate: '',
      updatedBy: -1,
      updatedDate: '',
    );
  }

  @override
  List<Object> get props => [
    srId,
    srTicketNo,
    srItemId,
    srQty,
    srSRate,
    srDiscount,
    srGross,
    uniqueCode,
    createdBy,
    createdDate,
    updatedBy,
    updatedDate,
  ];
}
