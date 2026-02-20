// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tickets_by_id_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTicketsByIdResDto _$GetTicketsByIdResDtoFromJson(
  Map<String, dynamic> json,
) => GetTicketsByIdResDto(
  ticket: json['ticket'] == null
      ? null
      : TicketDto.fromJson(json['ticket'] as Map<String, dynamic>),
  complaints: (json['complaint'] as List<dynamic>?)
      ?.map((e) => ComplaintDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  technicians: (json['technicians'] as List<dynamic>?)
      ?.map((e) => TechnicianDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetTicketsByIdResDtoToJson(
  GetTicketsByIdResDto instance,
) => <String, dynamic>{
  'ticket': instance.ticket,
  'complaint': instance.complaints,
  'technicians': instance.technicians,
};

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
  entryNo: (json['si_entryno'] as num?)?.toInt(),
  customerName: json['si_cust_name'] as String?,
  mobileNumber: json['scr_mobile_no'] as String?,
  company: json['si_company'] as String?,
  model: json['si_model'] as String?,
  finish: json['si_finish'] as String?,
  assignTo: (json['si_assign_to'] as num?)?.toInt(),
  technician: json['Technician'] as String?,
  estimateCost: json['EstimateCost'] as String?,
);

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
  'si_entryno': instance.entryNo,
  'si_cust_name': instance.customerName,
  'scr_mobile_no': instance.mobileNumber,
  'si_company': instance.company,
  'si_model': instance.model,
  'si_finish': instance.finish,
  'si_assign_to': instance.assignTo,
  'Technician': instance.technician,
  'EstimateCost': instance.estimateCost,
};

ComplaintDto _$ComplaintDtoFromJson(Map<String, dynamic> json) => ComplaintDto(
  itemId: (json['li_ir_id'] as num?)?.toInt(),
  itemName: json['ir_name'] as String?,
  remarks: json['li_remarks'] as String?,
);

Map<String, dynamic> _$ComplaintDtoToJson(ComplaintDto instance) =>
    <String, dynamic>{
      'li_ir_id': instance.itemId,
      'ir_name': instance.itemName,
      'li_remarks': instance.remarks,
    };

TechnicianDto _$TechnicianDtoFromJson(Map<String, dynamic> json) =>
    TechnicianDto(
      id: (json['as_id'] as num?)?.toInt(),
      name: json['as_name'] as String?,
      mobile: json['as_mob'] as String?,
      isActive: (json['as_active'] as num?)?.toInt(),
      workCount: (json['WorkCount'] as num?)?.toInt(),
      status: json['TechnicianStatus'] as String?,
    );

Map<String, dynamic> _$TechnicianDtoToJson(TechnicianDto instance) =>
    <String, dynamic>{
      'as_id': instance.id,
      'as_name': instance.name,
      'as_mob': instance.mobile,
      'as_active': instance.isActive,
      'WorkCount': instance.workCount,
      'TechnicianStatus': instance.status,
    };
