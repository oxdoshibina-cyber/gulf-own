import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'insert_items_collected_res_dto.g.dart';

@JsonSerializable()
class InsertItemsCollectedResDto {
  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "message")
  final String? message;

  InsertItemsCollectedResDto({
    this.status,
    this.message,
  });

  factory InsertItemsCollectedResDto.fromJson(Map<String, dynamic> json) =>
      _$InsertItemsCollectedResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InsertItemsCollectedResDtoToJson(this);

  //Converts the DTO to a domain model
  CommonResponseModel toModel() {
    return CommonResponseModel(
      status: status ?? "",
      message: message ?? "",
    );
  }
}
