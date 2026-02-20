import 'package:json_annotation/json_annotation.dart';

import 'completed_work_details_ticket_dto.dart';
import 'completed_work_details_complaint_dto.dart';
import 'completed_work_details_spare_dto.dart';

import '../../../domain/completed_works/model/completed_work_details_res_model.dart';

part 'completed_work_details_response_dto.g.dart';

@JsonSerializable()
class CompletedWorkDetailsResponseDto {
  @JsonKey(name: "ticket")
  final CompletedWorkTicketDto? ticket;

  @JsonKey(name: "complaint")
  final List<CompletedWorkComplaintDto>? complaintList;

  @JsonKey(name: "SpareList")
  final List<CompletedWorkSpareDto>? spareList;

  CompletedWorkDetailsResponseDto({
    required this.ticket,
    required this.complaintList,
    required this.spareList,
  });

  factory CompletedWorkDetailsResponseDto.fromJson(
      Map<String, dynamic> json) =>
      _$CompletedWorkDetailsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompletedWorkDetailsResponseDtoToJson(this);

  CompletedWorkDetailsResponseModel toModel() {
    return CompletedWorkDetailsResponseModel(
      ticket: ticket!.toModel(),
      complaintList:
      complaintList?.map((e) => e.toModel()).toList() ?? [],
      spareList:
      spareList?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}
