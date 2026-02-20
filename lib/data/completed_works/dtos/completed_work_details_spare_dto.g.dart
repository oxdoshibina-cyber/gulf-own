// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_work_details_spare_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkSpareDto _$CompletedWorkSpareDtoFromJson(
  Map<String, dynamic> json,
) => CompletedWorkSpareDto(
  spareId: (json['sr_id'] as num?)?.toInt(),
  srTicketNo: (json['sr_ticket_no'] as num?)?.toInt(),
  srItemId: (json['sr_item_id'] as num?)?.toInt(),
  spareName: json['ir_name'] as String?,
  srStatus: json['sr_status'] as String?,
  qty: (json['sr_qty'] as num?)?.toInt(),
  srSRate: (json['sr_srate'] as num?)?.toInt(),
  srDiscount: (json['sr_discount'] as num?)?.toInt(),
  srGross: (json['sr_gross'] as num?)?.toInt(),
  srNet: (json['sr_net'] as num?)?.toInt(),
  srGst: (json['sr_gst'] as num?)?.toInt(),
  srTotal: (json['sr_total'] as num?)?.toInt(),
  createdBy: (json['created_by'] as num?)?.toInt(),
  createdDate: json['created_date'] as String?,
);

Map<String, dynamic> _$CompletedWorkSpareDtoToJson(
  CompletedWorkSpareDto instance,
) => <String, dynamic>{
  'sr_id': instance.spareId,
  'sr_ticket_no': instance.srTicketNo,
  'sr_item_id': instance.srItemId,
  'ir_name': instance.spareName,
  'sr_status': instance.srStatus,
  'sr_qty': instance.qty,
  'sr_srate': instance.srSRate,
  'sr_discount': instance.srDiscount,
  'sr_gross': instance.srGross,
  'sr_net': instance.srNet,
  'sr_gst': instance.srGst,
  'sr_total': instance.srTotal,
  'created_by': instance.createdBy,
  'created_date': instance.createdDate,
};
