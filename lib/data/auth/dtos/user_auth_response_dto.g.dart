// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthResponseDto _$UserAuthResponseDtoFromJson(Map<String, dynamic> json) =>
    UserAuthResponseDto(
      token: json['token'] as String,
      expiration: json['expiration'] as String,
      status: json['status'] as bool,
      userRole: json['user_role'] as String,
    );

Map<String, dynamic> _$UserAuthResponseDtoToJson(
  UserAuthResponseDto instance,
) => <String, dynamic>{
  'token': instance.token,
  'expiration': instance.expiration,
  'status': instance.status,
  'user_role': instance.userRole,
};
