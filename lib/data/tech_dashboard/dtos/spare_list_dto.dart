import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spare_list_dto.g.dart';

@JsonSerializable()
class SpareListDto {
  @JsonKey(name: "ir_id")
  final int? irId;

  @JsonKey(name: "ir_name")
  final String? irName;

  const SpareListDto({this.irId, this.irName});

  factory SpareListDto.fromJson(Map<String, dynamic> json) =>
      _$SpareListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SpareListDtoToJson(this);

  /// 🔁 DTO → Domain
  SpareListModel toModel() {
    return SpareListModel(irId: irId ?? -1, irName: irName ?? '');
  }
}
