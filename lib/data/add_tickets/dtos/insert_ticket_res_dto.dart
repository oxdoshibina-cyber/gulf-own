import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_ticket_res_dto.g.dart';

@JsonSerializable()
class InsertTicketResDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final int? data;

  InsertTicketResDto({this.message, this.data});

  factory InsertTicketResDto.fromJson(Map<String, dynamic> json) =>
      _$InsertTicketResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InsertTicketResDtoToJson(this);

  InsertTicketResModel toModel() {
    return InsertTicketResModel(message: message ?? "", data: data ?? -1);
  }
}
