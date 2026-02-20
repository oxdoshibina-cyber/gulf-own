import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response_dto.g.dart';

@JsonSerializable()
class CommonResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  CommonResponseDto({this.status, this.message});

  factory CommonResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseDtoToJson(this);

  CommonResponseModel toModel() {
    return CommonResponseModel(status: status ?? "", message: message ?? "");
  }
}
