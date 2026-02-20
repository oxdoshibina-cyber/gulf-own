// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceCategoryDto _$GetServiceCategoryDtoFromJson(
  Map<String, dynamic> json,
) => GetServiceCategoryDto(
  cId: (json['c_id'] as num?)?.toInt(),
  cName: json['c_name'] as String?,
  cRemarks: json['c_remarks'] as String?,
  cGroup3Id: (json['c_group3_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetServiceCategoryDtoToJson(
  GetServiceCategoryDto instance,
) => <String, dynamic>{
  'c_id': instance.cId,
  'c_name': instance.cName,
  'c_remarks': instance.cRemarks,
  'c_group3_id': instance.cGroup3Id,
};
