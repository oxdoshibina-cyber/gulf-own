// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_description_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDescriptionListDto _$GetDescriptionListDtoFromJson(
  Map<String, dynamic> json,
) => GetDescriptionListDto(
  irId: (json['ir_id'] as num?)?.toInt(),
  irName: json['ir_name'] as String?,
);

Map<String, dynamic> _$GetDescriptionListDtoToJson(
  GetDescriptionListDto instance,
) => <String, dynamic>{'ir_id': instance.irId, 'ir_name': instance.irName};
