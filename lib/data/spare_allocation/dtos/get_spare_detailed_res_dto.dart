import 'package:gulfownsalesview/data/spare_allocation/dtos/spare_detailed_spare_dto.dart';
import 'package:gulfownsalesview/data/spare_allocation/dtos/spare_detailed_ticket_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/spare_allocation/model/get_spare_detailed_res_model.dart';

part 'get_spare_detailed_res_dto.g.dart';

@JsonSerializable()
class GetSpareDetailedResponseDto {
  @JsonKey(name: "ticket")
  final SpareDetailedTicketDto? ticket;

  @JsonKey(name: "spare")
  final List<SpareDetailedSpareDto>? spareList;

  GetSpareDetailedResponseDto({
    required this.ticket,
    required this.spareList,
  });

  factory GetSpareDetailedResponseDto.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$GetSpareDetailedResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSpareDetailedResponseDtoToJson(this);

  /// DTO → Domain
  GetSpareDetailedResponseModel toModel() {
    return GetSpareDetailedResponseModel(
      ticket: ticket?.toModel() ?? SpareDetailedTicketModel.dummy(),
      spareList: spareList?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}
