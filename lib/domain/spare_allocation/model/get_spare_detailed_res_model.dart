import 'package:equatable/equatable.dart';

class GetSpareDetailedResponseModel extends Equatable{
final SpareDetailedTicketModel ticket;
final List<SpareDetailedSpareModel?> spareList;

GetSpareDetailedResponseModel(
    {
      required this.ticket,
      required this.spareList,
    });

@override
List<Object?> get props => [
  ticket,
  spareList,
];

factory GetSpareDetailedResponseModel.dummy(){
  return GetSpareDetailedResponseModel(
    ticket: SpareDetailedTicketModel.dummy(),
    spareList: const [],
  );
}



}

class SpareDetailedSpareModel extends Equatable{
  final String irName;
  final int srQty;
  final int srSrate;
  final String siStatus;
  SpareDetailedSpareModel(
      {
        required this.irName,
        required this.srQty,
        required this.srSrate,
        required this.siStatus,
      });

  @override
  List<Object?> get props => [
    irName,
    srQty,
    srSrate,
    siStatus,
  ];

  factory SpareDetailedSpareModel.dummy(){
    return SpareDetailedSpareModel(
      irName: '',
      srQty: -1,
      srSrate: -1,
      siStatus: '',
    );
  }

}

class SpareDetailedTicketModel extends Equatable{
  final int siEntryNo;
  final String siCustName;
  final String scrMobileNo;
  final String siCompany;
  final String siModel;
  final String siFinish;
  final int siAssignTo;
  final String technician;
  final String estimateCost;
final String siDeliveryDate;
  SpareDetailedTicketModel(
      {
        required this.siEntryNo,
        required this.siCustName,
        required this.scrMobileNo,
        required this.siCompany,
        required this.siModel,
        required this.siFinish,
        required this.siAssignTo,
        required this.technician,
        required this.estimateCost,
        required this.siDeliveryDate,
      });

  factory SpareDetailedTicketModel.dummy(){
    return SpareDetailedTicketModel(
      siEntryNo: -1,
      siCustName: '',
      scrMobileNo: '',
      siCompany: '',
      siModel: '',
      siFinish: '',
      siAssignTo: -1,
      technician: '',
      estimateCost: '',
      siDeliveryDate: '',
    );
  }

@override
List<Object?> get props => [
  siEntryNo,
  siCustName,
  scrMobileNo,
  siCompany,
  siModel,
  siFinish,
  siAssignTo,
  technician,
  estimateCost,
  siDeliveryDate,
];
}