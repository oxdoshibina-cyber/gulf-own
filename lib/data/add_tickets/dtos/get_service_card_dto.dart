import 'package:gulfownsalesview/domain/add_tickets/model/get_service_card_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_service_card_dto.g.dart';

@JsonSerializable()
class GetServiceCardDto {
  @JsonKey(name: 'as_id')
  final int? id;

  @JsonKey(name: 'as_name')
  final String? name;

  const GetServiceCardDto({this.id, this.name});

  factory GetServiceCardDto.fromJson(Map<String, dynamic> json) =>
      _$GetServiceCardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceCardDtoToJson(this);

  GetServiceCardModel toModel() {
    return GetServiceCardModel(id: id ?? -1, name: name ?? '');
  }
}
