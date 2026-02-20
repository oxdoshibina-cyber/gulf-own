import 'package:gulfownsalesview/domain/add_tickets/model/get_service_cash_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_service_cash_dto.g.dart';

@JsonSerializable()
class GetServiceCashDto {
  @JsonKey(name: 'as_id')
  final int? id;

  @JsonKey(name: 'as_name')
  final String? name;

  const GetServiceCashDto({this.id, this.name});

  factory GetServiceCashDto.fromJson(Map<String, dynamic> json) =>
      _$GetServiceCashDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceCashDtoToJson(this);

  GetServiceCashModel toModel() {
    return GetServiceCashModel(id: id ?? -1, name: name ?? '');
  }
}
