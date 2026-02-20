import 'package:gulfownsalesview/domain/auth/model/user_auth_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_auth_response_dto.g.dart';

@JsonSerializable()
class UserAuthResponseDto {
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "expiration")
  final String expiration;
  @JsonKey(name: "status")
  final bool status;
  @JsonKey(name: "user_role")
  final String userRole;

  UserAuthResponseDto({
    required this.token,
    required this.expiration,
    required this.status,
    required this.userRole,
  });

  factory UserAuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserAuthResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthResponseDtoToJson(this);

  UserAuthResModel toModel() {
    return UserAuthResModel(
      token: token,
      expiration: expiration,
      status: status,
      userRole: userRole,
    );
  }
}
