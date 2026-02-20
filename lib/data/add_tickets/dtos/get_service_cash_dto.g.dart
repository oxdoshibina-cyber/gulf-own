// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_cash_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceCashDto _$GetServiceCashDtoFromJson(Map<String, dynamic> json) =>
    GetServiceCashDto(
      id: (json['as_id'] as num?)?.toInt(),
      name: json['as_name'] as String?,
    );

Map<String, dynamic> _$GetServiceCashDtoToJson(GetServiceCashDto instance) =>
    <String, dynamic>{'as_id': instance.id, 'as_name': instance.name};
