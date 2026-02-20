import 'package:equatable/equatable.dart';

class CompletedWorkDetailsResponseModel extends Equatable {
  final CompletedWorkTicketModel ticket;
  final List<CompletedWorkComplaintModel> complaintList;
  final List<CompletedWorkSpareModel> spareList;

  const CompletedWorkDetailsResponseModel({
    required this.ticket,
    required this.complaintList,
    required this.spareList,
  });

  factory CompletedWorkDetailsResponseModel.dummy(){
    return CompletedWorkDetailsResponseModel(
      ticket: CompletedWorkTicketModel.dummy(),
      complaintList: const [],
      spareList: const [],
    );
  }

  @override
  List<Object?> get props => [
    ticket,
    complaintList,
    spareList,
  ];
}


//Ticket Model

class CompletedWorkTicketModel extends Equatable {
  final int siEntryNo;
  final String siCustName;
  final String scrMobileNo;
  final String siCompany;
  final String siModel;
  final String siFinish;
  final int siAssignTo;
  final String technician;
  final String estimateCost;
  final int siCashPaidAcc;
  final int siCashReceived;
  final int siBankAcc;
  final int siCardAmount;
  final int siOtherCharge;
  final int siBalance;
  final int serviceCharge;
  final int advanceReceived;
  final int siTotal;
  final int siGrandTotal;
  final int siOtherDisc;
  final String siRemarks;
  final String relocatedTechnician;
  final String relocatedReason;

  const CompletedWorkTicketModel({
    required this.siEntryNo,
    required this.siCustName,
    required this.scrMobileNo,
    required this.siCompany,
    required this.siModel,
    required this.siFinish,
    required this.siAssignTo,
    required this.technician,
    required this.estimateCost,
    required this.siCashPaidAcc,
    required this.siCashReceived,
    required this.siBankAcc,
    required this.siCardAmount,
    required this.siOtherCharge,
    required this.siBalance,
    required this.serviceCharge,
    required this.advanceReceived,
    required this.siTotal,
    required this.siGrandTotal,
    required this.siOtherDisc,
    required this.siRemarks,
    required this.relocatedTechnician,
    required this.relocatedReason,
  });

  factory CompletedWorkTicketModel.dummy(){
    return CompletedWorkTicketModel(
      siEntryNo: -1,
        siCustName: '',
        scrMobileNo: '',
        siCompany: '',
        siModel: '',
        siFinish: '',
        siAssignTo: -1,
        technician: '',
        estimateCost: '',
        siCashPaidAcc: -1,
        siCashReceived: -1,
        siBankAcc: -1,
        siCardAmount: -1,
        siOtherCharge: -1,
        siBalance: -1,
        serviceCharge: -1,
        advanceReceived: -1,
        siTotal: -1,
        siGrandTotal: -1,
        siOtherDisc: -1,
        siRemarks: '',
        relocatedTechnician: '',
        relocatedReason: '',
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
    siCashPaidAcc,
    siCashReceived,
    siBankAcc,
    siCardAmount,
    siOtherCharge,
    siBalance,
    serviceCharge,
    advanceReceived,
    siTotal,
    siGrandTotal,
    siOtherDisc,
    siRemarks,
    relocatedTechnician,
    relocatedReason,
  ];
}


//Complaint Model

class CompletedWorkComplaintModel extends Equatable {
  final int liIrId;
  final String irName;
  final String liRemarks;

  const CompletedWorkComplaintModel({
    required this.liIrId,
    required this.irName,
    required this.liRemarks,
  });

  @override
  List<Object?> get props => [
    liIrId,
    irName,
    liRemarks,
  ];
}


//Spare List Model

class CompletedWorkSpareModel extends Equatable {
  final int spareId;
  final int srTicketNo;
  final int srItemId;
  final String spareName;
  final String srStatus;
  final int qty;
  final int srSRate;
  final int srDiscount;
  final int srGross;
  final int srNet;
  final int srGst;
  final int srTotal;
  final int createdBy;
  final String createdDate;

  const CompletedWorkSpareModel({
    required this.spareId,
    required this.srTicketNo,
    required this.srItemId,
    required this.spareName,
    required this.srStatus,
    required this.qty,
    required this.srSRate,
    required this.srDiscount,
    required this.srGross,
    required this.srNet,
    required this.srGst,
    required this.srTotal,
    required this.createdBy,
    required this.createdDate,
  });

  @override
  List<Object?> get props => [
    spareId,
    srTicketNo,
    srItemId,
    spareName,
    srStatus,
    qty,
    srSRate,
    srDiscount,
    srGross,
    srNet,
    srGst,
    srTotal,
    createdBy,
    createdDate,
  ];
}
