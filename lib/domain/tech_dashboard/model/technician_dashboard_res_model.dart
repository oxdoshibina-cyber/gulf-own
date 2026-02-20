// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TechnicianDashboardResModel extends Equatable {
  final TicketModel? ticket;
  final List<ComplaintModel> complaints;
  final List<SpareList> spareList;

  const TechnicianDashboardResModel({
    required this.ticket,
    required this.complaints,
    required this.spareList,
  });

  factory TechnicianDashboardResModel.dummy() {
    return const TechnicianDashboardResModel(
      ticket: null,
      complaints: [],
      spareList: [],
    );
  }

  TechnicianDashboardResModel copyWith({
    TicketModel? ticket,
    List<ComplaintModel>? complaints,
    List<SpareList>? spareList,
  }) {
    return TechnicianDashboardResModel(
      ticket: ticket ?? this.ticket,
      complaints: complaints ?? this.complaints,
      spareList: spareList ?? this.spareList,
    );
  }

  @override
  List<Object?> get props => [ticket, complaints, spareList];
}

class TicketModel extends Equatable {
  final int entryNo;
  final String customerName;
  final String mobileNumber;
  final String company;
  final String model;
  final String finish;
  final String otherRemarks;
  final int assignTo;
  final String technician;
  final String estimateCost;
  final String relocatedTechnician;
  final String relocatedReason;
  final String workedMinutes;

  const TicketModel({
    required this.entryNo,
    required this.customerName,
    required this.mobileNumber,
    required this.company,
    required this.model,
    required this.finish,
    required this.otherRemarks,
    required this.assignTo,
    required this.technician,
    required this.estimateCost,
    required this.relocatedTechnician,
    required this.relocatedReason,
    required this.workedMinutes,
  });

  factory TicketModel.dummy() {
    return const TicketModel(
      entryNo: -1,
      customerName: '',
      mobileNumber: '',
      company: '',
      model: '',
      finish: '',
      otherRemarks: '',
      assignTo: -1,
      technician: '',
      estimateCost: '',
      relocatedTechnician: '',
      relocatedReason: '',
      workedMinutes: ''
    );
  }

  @override
  List<Object?> get props => [
    entryNo,
    customerName,
    mobileNumber,
    company,
    model,
    finish,
    otherRemarks,
    assignTo,
    technician,
    estimateCost,
    relocatedTechnician,
    relocatedReason,
    workedMinutes,
  ];

  TicketModel copyWith({
    int? entryNo,
    String? customerName,
    String? mobileNumber,
    String? company,
    String? model,
    String? finish,
    String? otherRemarks,
    int? assignTo,
    String? technician,
    String? estimateCost,
    String? relocatedTechnician,
    String? relocatedReason,
    String? workedMinutes,
  }) {
    return TicketModel(
      entryNo: entryNo ?? this.entryNo,
      customerName: customerName ?? this.customerName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      company: company ?? this.company,
      model: model ?? this.model,
      finish: finish ?? this.finish,
      otherRemarks: otherRemarks ?? this.otherRemarks,
      assignTo: assignTo ?? this.assignTo,
      technician: technician ?? this.technician,
      estimateCost: estimateCost ?? this.estimateCost,
      relocatedTechnician: relocatedTechnician ?? this.relocatedTechnician,
      relocatedReason: relocatedReason ?? this.relocatedReason,
      workedMinutes: workedMinutes ?? this.workedMinutes,
    );
  }
}

class ComplaintModel extends Equatable {
  final int itemId;
  final String itemName;
  final String remarks;

  const ComplaintModel({
    required this.itemId,
    required this.itemName,
    required this.remarks,
  });

  factory ComplaintModel.dummy() {
    return const ComplaintModel(itemId: -1, itemName: '', remarks: '');
  }

  ComplaintModel copyWith({int? itemId, String? itemName, String? remarks}) {
    return ComplaintModel(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props => [itemId, itemName, remarks];
}

class SpareList extends Equatable {
  final int id;
  final int ticketNo;
  final int itemId;
  final String name;
  final int quantity;
  final double rate;
  final double discount;
  final double gross;
  final double net;
  final double gst;
  final double total;
  final String status;
  final int createdBy;
  final String createdDate;

  const SpareList({
    required this.id,
    required this.ticketNo,
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.rate,
    required this.discount,
    required this.gross,
    required this.net,
    required this.gst,
    required this.total,
    required this.status,
    required this.createdBy,
    required this.createdDate,
  });

  factory SpareList.dummy() {
    return const SpareList(
      id: -1,
      ticketNo: -1,
      itemId: -1,
      name: '',
      quantity: -1,
      rate: -1,
      discount: -1,
      gross: -1,
      net: -1,
      gst: -1,
      total: -1,
      status: '',
      createdBy: -1,
      createdDate: '',
    );
  }

  @override
  List<Object?> get props => [
    id,
    ticketNo,
    itemId,
    name,
    quantity,
    rate,
    discount,
    gross,
    net,
    gst,
    total,
    status,
    createdBy,
    createdDate,
  ];

  SpareList copyWith({
    int? id,
    int? ticketNo,
    int? itemId,
    String? name,
    int? quantity,
    double? rate,
    double? discount,
    double? gross,
    double? net,
    double? gst,
    double? total,
    String? status,
    int? createdBy,
    String? createdDate,
  }) {
    return SpareList(
      id: id ?? this.id,
      ticketNo: ticketNo ?? this.ticketNo,
      itemId: itemId ?? this.itemId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      discount: discount ?? this.discount,
      gross: gross ?? this.gross,
      net: net ?? this.net,
      gst: gst ?? this.gst,
      total: total ?? this.total,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
    );
  }
}
