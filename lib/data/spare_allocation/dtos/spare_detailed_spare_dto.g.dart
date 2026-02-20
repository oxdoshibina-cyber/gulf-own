// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_detailed_spare_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpareDetailedSpareDto _$SpareDetailedSpareDtoFromJson(
  Map<String, dynamic> json,
) => SpareDetailedSpareDto(
  irName: json['ir_name'] as String?,
  srQty: (json['sr_qty'] as num?)?.toInt(),
  srSrate: (json['sr_srate'] as num?)?.toInt(),
  srStatus: json['sr_status'] as String?,
);

Map<String, dynamic> _$SpareDetailedSpareDtoToJson(
  SpareDetailedSpareDto instance,
) => <String, dynamic>{
  'ir_name': instance.irName,
  'sr_qty': instance.srQty,
  'sr_srate': instance.srSrate,
  'sr_status': instance.srStatus,
};
