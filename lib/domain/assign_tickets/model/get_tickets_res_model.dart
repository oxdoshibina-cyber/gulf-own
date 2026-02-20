import 'package:equatable/equatable.dart';

class GetTicketsResModel extends Equatable {
  final int entryNo;
  final String customerName;
  final String mobileNumber;
  final String company;
  final String model;
  final int assignTo;
  final String estimateCost;
  final String deliveryDate;
  final String finish;
  final String technician;
  final String assignedDate;

  const GetTicketsResModel({
    required this.entryNo,
    required this.customerName,
    required this.mobileNumber,
    required this.company,
    required this.model,
    required this.assignTo,
    required this.estimateCost,
    required this.deliveryDate,
    required this.finish,
    required this.technician,
    required this.assignedDate,
  });

  factory GetTicketsResModel.dummy() {
    return const GetTicketsResModel(
      entryNo: -1,
      customerName: '',
      mobileNumber: '',
      company: '',
      model: '',
      assignTo: 0,
      estimateCost: '',
      deliveryDate: '',
      finish: '',
      technician: '',
      assignedDate: '',
    );
  }

  @override
  List<Object?> get props => [
    entryNo,
    customerName,
    mobileNumber,
    company,
    model,
    assignTo,
    estimateCost,
    deliveryDate,
    finish,
    technician,
    assignedDate,
  ];

  GetTicketsResModel copyWith({
    int? entryNo,
    String? customerName,
    String? mobileNumber,
    String? company,
    String? model,
    int? assignTo,
    String? estimateCost,
    String? deliveryDate,
    String? finish,
    String? technician,
    String? assignedDate,
  }) {
    return GetTicketsResModel(
      entryNo: entryNo ?? this.entryNo,
      customerName: customerName ?? this.customerName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      company: company ?? this.company,
      model: model ?? this.model,
      assignTo: assignTo ?? this.assignTo,
      estimateCost: estimateCost ?? this.estimateCost,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      finish: finish ?? this.finish,
      technician: technician ?? this.technician,
      assignedDate: assignedDate ?? this.assignedDate,
    );
  }
}
