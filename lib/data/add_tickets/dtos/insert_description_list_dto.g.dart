// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_description_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertDescriptionListDto _$InsertDescriptionListDtoFromJson(
  Map<String, dynamic> json,
) => InsertDescriptionListDto(
  irId: (json['ir_id'] as num?)?.toInt(),
  irName: json['ir_name'] as String?,
  irActive: (json['ir_active'] as num?)?.toInt(),
);

Map<String, dynamic> _$InsertDescriptionListDtoToJson(
  InsertDescriptionListDto instance,
) => <String, dynamic>{
  'ir_id': instance.irId,
  'ir_name': instance.irName,
  'ir_active': instance.irActive,
};
