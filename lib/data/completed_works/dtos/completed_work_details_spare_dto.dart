import 'package:json_annotation/json_annotation.dart';

import '../../../domain/completed_works/model/completed_work_details_res_model.dart';

part 'completed_work_details_spare_dto.g.dart';

@JsonSerializable()
class CompletedWorkSpareDto {

  @JsonKey(name: "sr_id")
  final int? spareId;

  @JsonKey(name: "sr_ticket_no")
  final int? srTicketNo;

  @JsonKey(name: "sr_item_id")
  final int? srItemId;

  @JsonKey(name: "ir_name")
  final String? spareName;

  @JsonKey(name: "sr_status")
  final String? srStatus;

  @JsonKey(name: "sr_qty")
  final int? qty;

  @JsonKey(name: "sr_srate")
  final int? srSRate;

  @JsonKey(name: "sr_discount")
  final int? srDiscount;

  @JsonKey(name: "sr_gross")
  final int? srGross;

  @JsonKey(name: "sr_net")
  final int? srNet;

  @JsonKey(name: "sr_gst")
  final int? srGst;

  @JsonKey(name: "sr_total")
  final int? srTotal;

  @JsonKey(name: "created_by")
  final int? createdBy;

  @JsonKey(name: "created_date")
  final String? createdDate;

  CompletedWorkSpareDto({
    required this.spareId,
    required this.srTicketNo,
    required this.srItemId,
    required this.spareName,
    required this.srStatus,
    required this.qty,
    required this.srSRate,
    required this.srDiscount,
    required this.srGross,
    required this.srNet,
    required this.srGst,
    required this.srTotal,
    required this.createdBy,
    required this.createdDate,
  });

  factory CompletedWorkSpareDto.fromJson(
      Map<String, dynamic> json) =>
      _$CompletedWorkSpareDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompletedWorkSpareDtoToJson(this);

  CompletedWorkSpareModel toModel() {
    return CompletedWorkSpareModel(
      spareId: spareId ?? 0,
      srTicketNo: srTicketNo ?? 0,
      srItemId: srItemId ?? 0,
      spareName: spareName ?? '',
      srStatus: srStatus ?? '',
      qty: qty ?? 0,
      srSRate: srSRate ?? 0,
      srDiscount: srDiscount ?? 0,
      srGross: srGross ?? 0,
      srNet: srNet ?? 0,
      srGst: srGst ?? 0,
      srTotal: srTotal ?? 0,
      createdBy: createdBy ?? 0,
      createdDate: createdDate ?? '',
    );
  }
}
