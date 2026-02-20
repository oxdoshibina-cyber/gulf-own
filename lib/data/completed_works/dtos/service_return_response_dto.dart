import 'package:json_annotation/json_annotation.dart';

import '../../../domain/completed_works/model/service_return_res_model.dart';

part 'service_return_response_dto.g.dart';

@JsonSerializable()
class ServiceReturnResponseDto {
  @JsonKey(name: "Success")
  final int? success;

  @JsonKey(name: "Message")
  final String? message;

  ServiceReturnResponseDto({
    this.success,
    this.message,
  });

  factory ServiceReturnResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceReturnResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceReturnResponseDtoToJson(this);

  /// Converts DTO → Domain Model
  ServiceReturnResponseModel toModel() {
    return ServiceReturnResponseModel(
      success: success ?? -1,
      message: message ?? "",
    );
  }
}
