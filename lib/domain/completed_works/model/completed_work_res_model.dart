import 'package:equatable/equatable.dart';

class CompletedWorkResponseModel extends Equatable{
  // final int? completedWorkId;
  final int? si_entryno;
  final int? si_assign_to;
  final String si_qtn_no;
  final String customerName;
  final String mobileNumber;
  final DateTime? assignDate;
  final DateTime? DeliveryDate;
  final String brand;
  final String model;
  final String? completedWorkStatus;
  final String technicianName;
  final String estimatedCost;


  CompletedWorkResponseModel(
      {
        // required this.completedWorkId,
        required this.si_entryno,
        required this.si_assign_to,
        required this.si_qtn_no,
        required this.customerName,
        required this.mobileNumber,
        required this.assignDate,
        required this.DeliveryDate,
        required this.brand,
        required this.model,
        required this.completedWorkStatus,
        required this.technicianName,
        required this.estimatedCost,
      });
  factory CompletedWorkResponseModel.dummy(){
    return CompletedWorkResponseModel(
      si_entryno: -1,
      si_assign_to: -1,
      si_qtn_no: '',
      customerName: '',
      mobileNumber: '',
      assignDate: DateTime.now(),
      DeliveryDate: DateTime.now(),
      brand: '',
      model: '',
      completedWorkStatus: '',
      technicianName: '',
      estimatedCost: '',
    );
  }
  @override
  List<Object?> get props => [
    si_entryno,
    si_assign_to,
    si_qtn_no,
    customerName,
    mobileNumber,
    assignDate,
    DeliveryDate,
    brand,
    model,
    completedWorkStatus,
    technicianName,
    estimatedCost,
  ];
}