import 'package:gulfownsalesview/domain/add_tickets/model/get_description_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_description_list_dto.g.dart';

@JsonSerializable()
class GetDescriptionListDto {
  @JsonKey(name: 'ir_id')
  final int? irId;

  @JsonKey(name: 'ir_name')
  final String? irName;

  const GetDescriptionListDto({
    this.irId,
    this.irName,
  });

  factory GetDescriptionListDto.fromJson(Map<String, dynamic> json) =>
      _$GetDescriptionListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDescriptionListDtoToJson(this);


  GetDescriptionListModel toModel() {
    return GetDescriptionListModel(
      irId: irId ?? -1,
      irName: irName ?? '',
    );
  }
}
