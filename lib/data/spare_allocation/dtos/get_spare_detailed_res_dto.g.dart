// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_spare_detailed_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpareDetailedResponseDto _$GetSpareDetailedResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetSpareDetailedResponseDto(
  ticket: json['ticket'] == null
      ? null
      : SpareDetailedTicketDto.fromJson(json['ticket'] as Map<String, dynamic>),
  spareList: (json['spare'] as List<dynamic>?)
      ?.map((e) => SpareDetailedSpareDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetSpareDetailedResponseDtoToJson(
  GetSpareDetailedResponseDto instance,
) => <String, dynamic>{'ticket': instance.ticket, 'spare': instance.spareList};
