// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_ticket_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertTicketResDto _$InsertTicketResDtoFromJson(Map<String, dynamic> json) =>
    InsertTicketResDto(
      message: json['message'] as String?,
      data: (json['data'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InsertTicketResDtoToJson(InsertTicketResDto instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};
