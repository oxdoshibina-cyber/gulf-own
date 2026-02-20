// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_spare_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertSpareResDto _$InsertSpareResDtoFromJson(Map<String, dynamic> json) =>
    InsertSpareResDto(
      srId: (json['sr_id'] as num?)?.toInt(),
      srTicketNo: (json['sr_ticket_no'] as num?)?.toInt(),
      srItemId: (json['sr_item_id'] as num?)?.toInt(),
      srQty: (json['sr_qty'] as num?)?.toInt(),
      srSRate: (json['sr_srate'] as num?)?.toDouble(),
      srDiscount: (json['sr_discount'] as num?)?.toDouble(),
      srGross: (json['sr_gross'] as num?)?.toDouble(),
      srNet: (json['sr_net'] as num?)?.toDouble(),
      srGst: (json['sr_gst'] as num?)?.toDouble(),
      srTotal: (json['sr_total'] as num?)?.toDouble(),
      srStatus: json['sr_status'] as String?,
      srUniqueCode: (json['sr_uniquecode'] as num?)?.toDouble(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      createdDate: json['created_date'] as String?,
      updatedBy: (json['updated_by'] as num?)?.toInt(),
      updatedDate: json['updated_date'] as String?,
    );

Map<String, dynamic> _$InsertSpareResDtoToJson(InsertSpareResDto instance) =>
    <String, dynamic>{
      'sr_id': instance.srId,
      'sr_ticket_no': instance.srTicketNo,
      'sr_item_id': instance.srItemId,
      'sr_qty': instance.srQty,
      'sr_srate': instance.srSRate,
      'sr_discount': instance.srDiscount,
      'sr_gross': instance.srGross,
      'sr_net': instance.srNet,
      'sr_gst': instance.srGst,
      'sr_total': instance.srTotal,
      'sr_status': instance.srStatus,
      'sr_uniquecode': instance.srUniqueCode,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate,
      'updated_by': instance.updatedBy,
      'updated_date': instance.updatedDate,
    };
