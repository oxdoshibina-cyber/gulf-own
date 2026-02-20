import 'package:equatable/equatable.dart';

class GetTicketsByIdResModel extends Equatable {
  final TicketModel? ticket;
  final List<ComplaintModel> complaints;
  final List<TechnicianModel> technicians;

  const GetTicketsByIdResModel({
    required this.ticket,
    required this.complaints,
    required this.technicians,
  });

  factory GetTicketsByIdResModel.dummy() {
    return const GetTicketsByIdResModel(
      ticket: null,
      complaints: [],
      technicians: [],
    );
  }

  GetTicketsByIdResModel copyWith({
    TicketModel? ticket,
    List<ComplaintModel>? complaints,
    List<TechnicianModel>? technicians,
  }) {
    return GetTicketsByIdResModel(
      ticket: ticket ?? this.ticket,
      complaints: complaints ?? this.complaints,
      technicians: technicians ?? this.technicians,
    );
  }

  @override
  List<Object?> get props => [ticket, complaints, technicians];
}

class TicketModel extends Equatable {
  final int entryNo;
  final String customerName;
  final String mobileNumber;
  final String company;
  final String model;
  final String finish;
  final int assignTo;
  final String technician;
  final String estimateCost;

  const TicketModel({
    required this.entryNo,
    required this.customerName,
    required this.mobileNumber,
    required this.company,
    required this.model,
    required this.finish,
    required this.assignTo,
    required this.technician,
    required this.estimateCost,
  });

  factory TicketModel.dummy() {
    return const TicketModel(
      entryNo: -1,
      customerName: '',
      mobileNumber: '',
      company: '',
      model: '',
      finish: '',
      assignTo: 0,
      technician: '',
      estimateCost: '',
    );
  }

  TicketModel copyWith({
    int? entryNo,
    String? customerName,
    String? mobileNumber,
    String? company,
    String? model,
    String? finish,
    int? assignTo,
    String? technician,
    String? estimateCost,
  }) {
    return TicketModel(
      entryNo: entryNo ?? this.entryNo,
      customerName: customerName ?? this.customerName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      company: company ?? this.company,
      model: model ?? this.model,
      finish: finish ?? this.finish,
      assignTo: assignTo ?? this.assignTo,
      technician: technician ?? this.technician,
      estimateCost: estimateCost ?? this.estimateCost,
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
    assignTo,
    technician,
    estimateCost,
  ];
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

class TechnicianModel extends Equatable {
  final int id;
  final String name;
  final String mobile;
  final int isActive;
  final int workCount;
  final String status;

  const TechnicianModel({
    required this.id,
    required this.name,
    required this.mobile,
    required this.isActive,
    required this.workCount,
    required this.status,
  });

  factory TechnicianModel.dummy() {
    return const TechnicianModel(
      id: -1,
      name: '',
      mobile: '',
      isActive: 0,
      workCount: 0,
      status: '',
    );
  }

  TechnicianModel copyWith({
    int? id,
    String? name,
    String? mobile,
    int? isActive,
    int? workCount,
    String? status,
  }) {
    return TechnicianModel(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      isActive: isActive ?? this.isActive,
      workCount: workCount ?? this.workCount,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [id, name, mobile, isActive, workCount, status];
}
