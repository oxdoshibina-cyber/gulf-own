// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_work_details_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkDetailsResponseDto _$CompletedWorkDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => CompletedWorkDetailsResponseDto(
  ticket: json['ticket'] == null
      ? null
      : CompletedWorkTicketDto.fromJson(json['ticket'] as Map<String, dynamic>),
  complaintList: (json['complaint'] as List<dynamic>?)
      ?.map(
        (e) => CompletedWorkComplaintDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  spareList: (json['SpareList'] as List<dynamic>?)
      ?.map((e) => CompletedWorkSpareDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CompletedWorkDetailsResponseDtoToJson(
  CompletedWorkDetailsResponseDto instance,
) => <String, dynamic>{
  'ticket': instance.ticket,
  'complaint': instance.complaintList,
  'SpareList': instance.spareList,
};
