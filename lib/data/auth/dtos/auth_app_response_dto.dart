import 'package:gulfownsalesview/domain/auth/model/app_auth_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_app_response_dto.g.dart';

@JsonSerializable()
class AuthAppResponseDto {
  @JsonKey(name: "token")
  final dynamic token;

  @JsonKey(name: "status")
  final bool status;

  AuthAppResponseDto({required this.token, required this.status});

  factory AuthAppResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthAppResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthAppResponseDtoToJson(this);

  AppAuthResModel toModel() {
    return AppAuthResModel(
      token: token.toString(), 
      status: status,
    );
  }
}
