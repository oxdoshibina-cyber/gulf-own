// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceCardDto _$GetServiceCardDtoFromJson(Map<String, dynamic> json) =>
    GetServiceCardDto(
      id: (json['as_id'] as num?)?.toInt(),
      name: json['as_name'] as String?,
    );

Map<String, dynamic> _$GetServiceCardDtoToJson(GetServiceCardDto instance) =>
    <String, dynamic>{'as_id': instance.id, 'as_name': instance.name};
