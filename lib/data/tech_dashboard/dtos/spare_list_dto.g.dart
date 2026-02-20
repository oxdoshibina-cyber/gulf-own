// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpareListDto _$SpareListDtoFromJson(Map<String, dynamic> json) => SpareListDto(
  irId: (json['ir_id'] as num?)?.toInt(),
  irName: json['ir_name'] as String?,
);

Map<String, dynamic> _$SpareListDtoToJson(SpareListDto instance) =>
    <String, dynamic>{'ir_id': instance.irId, 'ir_name': instance.irName};
