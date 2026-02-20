import 'package:json_annotation/json_annotation.dart';
import '../../../domain/completed_works/model/completed_work_details_res_model.dart';

part 'completed_work_details_ticket_dto.g.dart';

@JsonSerializable()
class CompletedWorkTicketDto {
  @JsonKey(name: "si_entryno")
  final int? siEntryNo;

  @JsonKey(name: "si_cust_name")
  final String? siCustName;

  @JsonKey(name: "scr_mobile_no")
  final String? scrMobileNo;

  @JsonKey(name: "si_company")
  final String? siCompany;

  @JsonKey(name: "si_model")
  final String? siModel;

  @JsonKey(name: "si_finish")
  final String? siFinish;

  @JsonKey(name: "si_assign_to")
  final int? siAssignTo;

  @JsonKey(name: "Technician")
  final String? technician;

  @JsonKey(name: "EstimateCost")
  final String? estimateCost;

  @JsonKey(name: "si_cash_paid_acc")
  final int? siCashPaidAcc;

  @JsonKey(name: "si_cash_recieved")
  final int? siCashReceived;

  @JsonKey(name: "si_bankacc")
  final int? siBankAcc;

  @JsonKey(name: "si_card_amount")
  final int? siCardAmount;

  @JsonKey(name: "si_other_charge")
  final int? siOtherCharge;

  @JsonKey(name: "si_balance")
  final int? siBalance;

  @JsonKey(name: "serviceCharge")
  final int? serviceCharge;

  @JsonKey(name: "AdvanceReceived")
  final int? advanceReceived;

  @JsonKey(name: "si_total")
  final int? siTotal;

  @JsonKey(name: "si_grand_total")
  final int? siGrandTotal;

  @JsonKey(name: "si_other_disc")
  final int? siOtherDisc;

  @JsonKey(name: "si_remarks")
  final String? siRemarks;

  @JsonKey(name: "RelocatedTechnician")
  final String? relocatedTechnician;

  @JsonKey(name: "RelocatedReason")
  final String? relocatedReason;


  CompletedWorkTicketDto({
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

  factory CompletedWorkTicketDto.fromJson(Map<String, dynamic> json) =>
      _$CompletedWorkTicketDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompletedWorkTicketDtoToJson(this);

  CompletedWorkTicketModel toModel() {
    return CompletedWorkTicketModel(
      siEntryNo: siEntryNo ?? -1,
      siCustName: siCustName ?? '',
      scrMobileNo: scrMobileNo ?? '',
      siCompany: siCompany ?? '',
      siModel: siModel ?? '',
      siFinish: siFinish ?? '',
      siAssignTo: siAssignTo ?? 0,
      technician: technician ?? '',
      estimateCost: estimateCost ?? '',
      siCashPaidAcc: siCashPaidAcc ?? 0,
      siCashReceived: siCashReceived ?? 0,
      siBankAcc: siBankAcc ?? 0,
      siCardAmount: siCardAmount ?? 0,
      siOtherCharge: siOtherCharge ?? 0,
      siBalance: siBalance ?? 0,
      serviceCharge: serviceCharge ?? 0,
      advanceReceived: advanceReceived ?? 0,
      siTotal: siTotal ?? 0,
      siGrandTotal: siGrandTotal ?? 0,
      siOtherDisc: siOtherDisc ?? 0,
      siRemarks: siRemarks ?? '',
      relocatedTechnician: relocatedTechnician ?? '',
      relocatedReason: relocatedReason ?? '',
    );
  }
}
