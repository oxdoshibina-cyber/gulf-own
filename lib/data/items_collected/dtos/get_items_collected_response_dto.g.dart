// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_collected_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemsCollectedResponseDto _$GetItemsCollectedResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetItemsCollectedResponseDto(
  iicId: (json['iic_id'] as num?)?.toInt(),
  iicName: json['iic_name'] as String?,
  iicStatus: (json['iic_status'] as num?)?.toInt(),
  iicRemarks: json['iic_remarks'] as String?,
);

Map<String, dynamic> _$GetItemsCollectedResponseDtoToJson(
  GetItemsCollectedResponseDto instance,
) => <String, dynamic>{
  'iic_id': instance.iicId,
  'iic_name': instance.iicName,
  'iic_status': instance.iicStatus,
  'iic_remarks': instance.iicRemarks,
};
