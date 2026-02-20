// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_return_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceReturnResponseDto _$ServiceReturnResponseDtoFromJson(
  Map<String, dynamic> json,
) => ServiceReturnResponseDto(
  success: (json['Success'] as num?)?.toInt(),
  message: json['Message'] as String?,
);

Map<String, dynamic> _$ServiceReturnResponseDtoToJson(
  ServiceReturnResponseDto instance,
) => <String, dynamic>{
  'Success': instance.success,
  'Message': instance.message,
};
