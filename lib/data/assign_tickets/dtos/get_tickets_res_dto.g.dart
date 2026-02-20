// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tickets_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTicketsDto _$GetTicketsDtoFromJson(Map<String, dynamic> json) =>
    GetTicketsDto(
      entryNo: (json['si_entryno'] as num?)?.toInt(),
      customerName: json['si_cust_name'] as String?,
      mobileNumber: json['scr_mobile_no'] as String?,
      company: json['si_company'] as String?,
      model: json['si_model'] as String?,
      assignTo: (json['si_assign_to'] as num?)?.toInt(),
      estimateCost: json['EstimateCost'] as String?,
      deliveryDate: json['si_deliverydate'] as String?,
      finish: json['si_finish'] as String?,
      technician: json['Technician'] as String?,
      assignedDate: json['AssignedDate'] as String?,
    );

Map<String, dynamic> _$GetTicketsDtoToJson(GetTicketsDto instance) =>
    <String, dynamic>{
      'si_entryno': instance.entryNo,
      'si_cust_name': instance.customerName,
      'scr_mobile_no': instance.mobileNumber,
      'si_company': instance.company,
      'si_model': instance.model,
      'si_assign_to': instance.assignTo,
      'EstimateCost': instance.estimateCost,
      'si_deliverydate': instance.deliveryDate,
      'si_finish': instance.finish,
      'Technician': instance.technician,
      'AssignedDate': instance.assignedDate,
    };
