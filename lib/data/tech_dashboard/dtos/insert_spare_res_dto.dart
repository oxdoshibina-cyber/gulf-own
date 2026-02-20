import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_spare_res_dto.g.dart';

@JsonSerializable()
class InsertSpareResDto {
  @JsonKey(name: "sr_id")
  final int? srId;

  @JsonKey(name: "sr_ticket_no")
  final int? srTicketNo;

  @JsonKey(name: "sr_item_id")
  final int? srItemId;

  @JsonKey(name: "sr_qty")
  final int? srQty;

  @JsonKey(name: "sr_srate")
  final double? srSRate;

  @JsonKey(name: "sr_discount")
  final double? srDiscount;

  @JsonKey(name: "sr_gross")
  final double? srGross;

  @JsonKey(name: "sr_net")
  final double? srNet;

  @JsonKey(name: "sr_gst")
  final double? srGst;

  @JsonKey(name: "sr_total")
  final double? srTotal;

  @JsonKey(name: "sr_status")
  final String? srStatus;

  @JsonKey(name: "sr_uniquecode")
  final double? srUniqueCode;

  @JsonKey(name: "created_by")
  final int? createdBy;

  @JsonKey(name: "created_date")
  final String? createdDate;

  @JsonKey(name: "updated_by")
  final int? updatedBy;

  @JsonKey(name: "updated_date")
  final String? updatedDate;

  const InsertSpareResDto({
    this.srId,
    this.srTicketNo,
    this.srItemId,
    this.srQty,
    this.srSRate,
    this.srDiscount,
    this.srGross,
    this.srNet,
    this.srGst,
    this.srTotal,
    this.srStatus,
    this.srUniqueCode,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory InsertSpareResDto.fromJson(Map<String, dynamic> json) =>
      _$InsertSpareResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InsertSpareResDtoToJson(this);

  /// 🔁 DTO → Domain
  InsertSpareResModel toModel() {
    return InsertSpareResModel(
      srId: srId ?? -1,
      srTicketNo: srTicketNo ?? 0,
      srItemId: srItemId ?? -1,
      srQty: srQty ?? 0,
      srSRate: srSRate ?? 0.0,
      srDiscount: srDiscount ?? 0.0,
      srGross: srGross ?? 0.0,
      srNet: srNet ?? 0.0,
      srGst: srGst ?? 0.0,
      srTotal: srTotal ?? 0.0,
      srStatus: srStatus ?? '',
      uniqueCode: srUniqueCode ?? 0.0,
      createdBy: createdBy ?? -1,
      createdDate: createdDate ?? '',
      updatedBy: updatedBy ?? -1,
      updatedDate: updatedDate ?? '',
    );
  }
}
