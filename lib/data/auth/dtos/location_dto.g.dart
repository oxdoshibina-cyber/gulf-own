// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
  loactions: (json['loactions'] as List<dynamic>)
      .map((e) => LocationModelDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  area: json['area'] as List<dynamic>,
  route: json['route'] as List<dynamic>,
);

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'loactions': instance.loactions,
      'area': instance.area,
      'route': instance.route,
    };

LocationModelDto _$LocationModelDtoFromJson(Map<String, dynamic> json) =>
    LocationModelDto(
      glid: json['gl_id'] as String,
      glname: json['gl_name'] as String,
    );

Map<String, dynamic> _$LocationModelDtoToJson(LocationModelDto instance) =>
    <String, dynamic>{'gl_id': instance.glid, 'gl_name': instance.glname};
