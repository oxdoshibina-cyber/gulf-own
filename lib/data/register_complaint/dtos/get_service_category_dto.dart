import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_service_category_dto.g.dart';

@JsonSerializable()
class GetServiceCategoryDto {
  @JsonKey(name: "c_id")
  final int? cId;
  @JsonKey(name: "c_name")
  final String? cName;
  @JsonKey(name: "c_remarks")
  final String? cRemarks;
  @JsonKey(name: "c_group3_id")
  final int? cGroup3Id;

  GetServiceCategoryDto({this.cId, this.cName, this.cRemarks, this.cGroup3Id});

  factory GetServiceCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$GetServiceCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceCategoryDtoToJson(this);

  GetServiceCategory toModel() {
    return GetServiceCategory(
      cId: cId ?? -1,
      cName: cName ?? '',
      cRemarks: cRemarks ?? '',
      cGroup3Id: cGroup3Id ?? -1,
    );
  }
}
