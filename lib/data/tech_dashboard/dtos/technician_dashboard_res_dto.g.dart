// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician_dashboard_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicianDashboardResDto _$TechnicianDashboardResDtoFromJson(
  Map<String, dynamic> json,
) => TechnicianDashboardResDto(
  ticket: json['ticket'] == null
      ? null
      : TicketDto.fromJson(json['ticket'] as Map<String, dynamic>),
  complaints: (json['complaint'] as List<dynamic>?)
      ?.map((e) => ComplaintDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  spareList: (json['SpareList'] as List<dynamic>?)
      ?.map((e) => SpareListResDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TechnicianDashboardResDtoToJson(
  TechnicianDashboardResDto instance,
) => <String, dynamic>{
  'ticket': instance.ticket,
  'complaint': instance.complaints,
  'SpareList': instance.spareList,
};

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
  entryNo: (json['si_entryno'] as num?)?.toInt(),
  customerName: json['si_cust_name'] as String?,
  mobileNumber: json['scr_mobile_no'] as String?,
  company: json['si_company'] as String?,
  model: json['si_model'] as String?,
  finish: json['si_finish'] as String?,
  assignTo: (json['si_assign_to'] as num?)?.toInt(),
  otherRemarks: json['si_other_remarks'] as String?,
  technician: json['Technician'] as String?,
  estimateCost: json['EstimateCost'] as String?,
  relocatedTechnician: json['RelocatedTechnician'] as String?,
  relocatedReason: json['RelocatedReason'] as String?,
  workedMinutes: json['WorkedMinutes'] as String?,
);

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
  'si_entryno': instance.entryNo,
  'si_cust_name': instance.customerName,
  'scr_mobile_no': instance.mobileNumber,
  'si_company': instance.company,
  'si_model': instance.model,
  'si_finish': instance.finish,
  'si_assign_to': instance.assignTo,
  'si_other_remarks': instance.otherRemarks,
  'Technician': instance.technician,
  'EstimateCost': instance.estimateCost,
  'RelocatedTechnician': instance.relocatedTechnician,
  'RelocatedReason': instance.relocatedReason,
  'WorkedMinutes': instance.workedMinutes,
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

SpareListResDto _$SpareListResDtoFromJson(Map<String, dynamic> json) =>
    SpareListResDto(
      id: (json['sr_id'] as num?)?.toInt(),
      ticketNo: (json['sr_ticket_no'] as num?)?.toInt(),
      itemId: (json['sr_item_id'] as num?)?.toInt(),
      name: json['ir_name'] as String?,
      quantity: (json['sr_qty'] as num?)?.toInt(),
      rate: (json['sr_srate'] as num?)?.toDouble(),
      discount: (json['sr_discount'] as num?)?.toDouble(),
      gross: (json['sr_gross'] as num?)?.toDouble(),
      net: (json['sr_net'] as num?)?.toDouble(),
      gst: (json['sr_gst'] as num?)?.toDouble(),
      total: (json['sr_total'] as num?)?.toDouble(),
      status: json['sr_status'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$SpareListResDtoToJson(SpareListResDto instance) =>
    <String, dynamic>{
      'sr_id': instance.id,
      'sr_ticket_no': instance.ticketNo,
      'sr_item_id': instance.itemId,
      'ir_name': instance.name,
      'sr_qty': instance.quantity,
      'sr_srate': instance.rate,
      'sr_discount': instance.discount,
      'sr_gross': instance.gross,
      'sr_net': instance.net,
      'sr_gst': instance.gst,
      'sr_total': instance.total,
      'sr_status': instance.status,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate,
    };
