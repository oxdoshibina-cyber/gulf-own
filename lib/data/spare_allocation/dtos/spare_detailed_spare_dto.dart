import 'package:json_annotation/json_annotation.dart';

import '../../../domain/spare_allocation/model/get_spare_detailed_res_model.dart';

part 'spare_detailed_spare_dto.g.dart';

@JsonSerializable()
class SpareDetailedSpareDto {
  @JsonKey(name: "ir_name")
  final String? irName;

  @JsonKey(name: "sr_qty")
  final int? srQty;

  @JsonKey(name: "sr_srate")
  final int? srSrate;

  @JsonKey(name: "sr_status")
  final String? srStatus;


  SpareDetailedSpareDto({
    required this.irName,
    required this.srQty,
    required this.srSrate,
    required this.srStatus,
  });

  factory SpareDetailedSpareDto.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$SpareDetailedSpareDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SpareDetailedSpareDtoToJson(this);

  /// DTO → Domain
  SpareDetailedSpareModel toModel() {
    return SpareDetailedSpareModel(
      irName: irName ?? '',
      srQty: srQty ?? -1,
      srSrate: srSrate ?? -1,
      siStatus: srStatus ?? '',
    );
  }
}
