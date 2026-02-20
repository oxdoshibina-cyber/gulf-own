import 'package:json_annotation/json_annotation.dart';

import '../../../domain/items_collected/model/items_collected_response_model.dart'; // Assuming you will create a corresponding model file.

part 'get_items_collected_response_dto.g.dart';

@JsonSerializable()
class GetItemsCollectedResponseDto {
  @JsonKey(name: "iic_id")
  final int? iicId;

  @JsonKey(name: "iic_name")
  final String? iicName;

  @JsonKey(name: "iic_status")
  final int? iicStatus;

  @JsonKey(name: "iic_remarks")
  final String? iicRemarks;

  GetItemsCollectedResponseDto({
    required this.iicId,
    required this.iicName,
    required this.iicStatus,
    required this.iicRemarks,
  });

  factory GetItemsCollectedResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetItemsCollectedResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemsCollectedResponseDtoToJson(this);

  // Optional: toModel() method to convert DTO to a domain model.
  ItemsCollectedResponseModel toModel() {
    return ItemsCollectedResponseModel(
      iicId: iicId??-1,
      iicName: iicName??'',
      iicStatus: iicStatus??0,
      iicRemarks: iicRemarks??'',
    );
  }
}
