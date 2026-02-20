// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_work_details_ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkTicketDto _$CompletedWorkTicketDtoFromJson(
  Map<String, dynamic> json,
) => CompletedWorkTicketDto(
  siEntryNo: (json['si_entryno'] as num?)?.toInt(),
  siCustName: json['si_cust_name'] as String?,
  scrMobileNo: json['scr_mobile_no'] as String?,
  siCompany: json['si_company'] as String?,
  siModel: json['si_model'] as String?,
  siFinish: json['si_finish'] as String?,
  siAssignTo: (json['si_assign_to'] as num?)?.toInt(),
  technician: json['Technician'] as String?,
  estimateCost: json['EstimateCost'] as String?,
  siCashPaidAcc: (json['si_cash_paid_acc'] as num?)?.toInt(),
  siCashReceived: (json['si_cash_recieved'] as num?)?.toInt(),
  siBankAcc: (json['si_bankacc'] as num?)?.toInt(),
  siCardAmount: (json['si_card_amount'] as num?)?.toInt(),
  siOtherCharge: (json['si_other_charge'] as num?)?.toInt(),
  siBalance: (json['si_balance'] as num?)?.toInt(),
  serviceCharge: (json['serviceCharge'] as num?)?.toInt(),
  advanceReceived: (json['AdvanceReceived'] as num?)?.toInt(),
  siTotal: (json['si_total'] as num?)?.toInt(),
  siGrandTotal: (json['si_grand_total'] as num?)?.toInt(),
  siOtherDisc: (json['si_other_disc'] as num?)?.toInt(),
  siRemarks: json['si_remarks'] as String?,
  relocatedTechnician: json['RelocatedTechnician'] as String?,
  relocatedReason: json['RelocatedReason'] as String?,
);

Map<String, dynamic> _$CompletedWorkTicketDtoToJson(
  CompletedWorkTicketDto instance,
) => <String, dynamic>{
  'si_entryno': instance.siEntryNo,
  'si_cust_name': instance.siCustName,
  'scr_mobile_no': instance.scrMobileNo,
  'si_company': instance.siCompany,
  'si_model': instance.siModel,
  'si_finish': instance.siFinish,
  'si_assign_to': instance.siAssignTo,
  'Technician': instance.technician,
  'EstimateCost': instance.estimateCost,
  'si_cash_paid_acc': instance.siCashPaidAcc,
  'si_cash_recieved': instance.siCashReceived,
  'si_bankacc': instance.siBankAcc,
  'si_card_amount': instance.siCardAmount,
  'si_other_charge': instance.siOtherCharge,
  'si_balance': instance.siBalance,
  'serviceCharge': instance.serviceCharge,
  'AdvanceReceived': instance.advanceReceived,
  'si_total': instance.siTotal,
  'si_grand_total': instance.siGrandTotal,
  'si_other_disc': instance.siOtherDisc,
  'si_remarks': instance.siRemarks,
  'RelocatedTechnician': instance.relocatedTechnician,
  'RelocatedReason': instance.relocatedReason,
};
