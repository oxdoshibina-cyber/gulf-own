import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_description_list_dto.g.dart';

@JsonSerializable()
class InsertDescriptionListDto {
  @JsonKey(name: 'ir_id')
  final int? irId;

  @JsonKey(name: 'ir_name')
  final String? irName;

  @JsonKey(name: 'ir_active')
  final int? irActive;

  const InsertDescriptionListDto({this.irId, this.irName, this.irActive});

  factory InsertDescriptionListDto.fromJson(Map<String, dynamic> json) =>
      _$InsertDescriptionListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InsertDescriptionListDtoToJson(this);

  InsertDescriptionResModel toModel() {
    return InsertDescriptionResModel(
      irId: irId ?? -1,
      irName: irName ?? '',
      irActive: irActive ?? 0,
    );
  }
}
