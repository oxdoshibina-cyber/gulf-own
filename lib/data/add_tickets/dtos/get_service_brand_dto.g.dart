// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_brand_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceBrandDto _$GetServiceBrandDtoFromJson(Map<String, dynamic> json) =>
    GetServiceBrandDto(
      companyId: (json['company_id'] as num?)?.toInt(),
      companyName: json['company_name'] as String?,
      companyRemarks: json['company_remarks'] as String?,
    );

Map<String, dynamic> _$GetServiceBrandDtoToJson(GetServiceBrandDto instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'company_name': instance.companyName,
      'company_remarks': instance.companyRemarks,
    };
