import 'package:gulfownsalesview/domain/tech_dashboard/model/technician_dashboard_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technician_dashboard_res_dto.g.dart';

@JsonSerializable()
class TechnicianDashboardResDto {
  @JsonKey(name: "ticket")
  final TicketDto? ticket;

  @JsonKey(name: "complaint")
  final List<ComplaintDto>? complaints;

  @JsonKey(name: "SpareList")
  final List<SpareListResDto>? spareList;

  const TechnicianDashboardResDto({
    this.ticket,
    this.complaints,
    this.spareList,
  });

  factory TechnicianDashboardResDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianDashboardResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianDashboardResDtoToJson(this);

  TechnicianDashboardResModel toModel() {
    return TechnicianDashboardResModel(
      ticket: ticket?.toModel(),
      complaints: complaints?.map((e) => e.toModel()).toList() ?? [],
      spareList: spareList?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class TicketDto {
  @JsonKey(name: "si_entryno")
  final int? entryNo;

  @JsonKey(name: "si_cust_name")
  final String? customerName;

  @JsonKey(name: "scr_mobile_no")
  final String? mobileNumber;

  @JsonKey(name: "si_company")
  final String? company;

  @JsonKey(name: "si_model")
  final String? model;

  @JsonKey(name: "si_finish")
  final String? finish;

  @JsonKey(name: "si_assign_to")
  final int? assignTo;

  @JsonKey(name: "si_other_remarks")
  final String? otherRemarks;

  @JsonKey(name: "Technician")
  final String? technician;

  @JsonKey(name: "EstimateCost")
  final String? estimateCost;

  @JsonKey(name: "RelocatedTechnician")
  final String? relocatedTechnician;

  @JsonKey(name: "RelocatedReason")
  final String? relocatedReason;

  @JsonKey(name: "WorkedMinutes")
  final String? workedMinutes;

  const TicketDto({
    this.entryNo,
    this.customerName,
    this.mobileNumber,
    this.company,
    this.model,
    this.finish,
    this.assignTo,
    this.otherRemarks,
    this.technician,
    this.estimateCost,
    this.relocatedTechnician,
    this.relocatedReason,
    this.workedMinutes,
  });

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDtoToJson(this);

  TicketModel toModel() {
    return TicketModel(
      entryNo: entryNo ?? -1,
      customerName: customerName ?? '',
      mobileNumber: mobileNumber ?? '',
      company: company ?? '',
      model: model ?? '',
      finish: finish ?? '',
      otherRemarks: otherRemarks ?? '',
      assignTo: assignTo ?? -1,
      technician: technician ?? '',
      estimateCost: estimateCost ?? '',
      relocatedTechnician: relocatedTechnician ?? '',
      relocatedReason: relocatedReason ?? '',
      workedMinutes: workedMinutes ?? '',
    );
  }
}

@JsonSerializable()
class ComplaintDto {
  @JsonKey(name: "li_ir_id")
  final int? itemId;

  @JsonKey(name: "ir_name")
  final String? itemName;

  @JsonKey(name: "li_remarks")
  final String? remarks;

  const ComplaintDto({this.itemId, this.itemName, this.remarks});

  factory ComplaintDto.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintDtoToJson(this);

  ComplaintModel toModel() {
    return ComplaintModel(
      itemId: itemId ?? -1,
      itemName: itemName ?? '',
      remarks: remarks ?? '',
    );
  }
}

@JsonSerializable()
class SpareListResDto {
  @JsonKey(name: "sr_id")
  final int? id;

  @JsonKey(name: "sr_ticket_no")
  final int? ticketNo;

  @JsonKey(name: "sr_item_id")
  final int? itemId;

  @JsonKey(name: "ir_name")
  final String? name;

  @JsonKey(name: "sr_qty")
  final int? quantity;

  @JsonKey(name: "sr_srate")
  final double? rate;

  @JsonKey(name: "sr_discount")
  final double? discount;

  @JsonKey(name: "sr_gross")
  final double? gross;

  @JsonKey(name: "sr_net")
  final double? net;

  @JsonKey(name: "sr_gst")
  final double? gst;

  @JsonKey(name: "sr_total")
  final double? total;

  @JsonKey(name: "sr_status")
  final String? status;

  @JsonKey(name: "created_by")
  final int? createdBy;

  @JsonKey(name: "created_date")
  final String? createdDate;

  const SpareListResDto({
    this.id,
    this.ticketNo,
    this.itemId,
    this.name,
    this.quantity,
    this.rate,
    this.discount,
    this.gross,
    this.net,
    this.gst,
    this.total,
    this.status,
    this.createdBy,
    this.createdDate,
  });

  factory SpareListResDto.fromJson(Map<String, dynamic> json) =>
      _$SpareListResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SpareListResDtoToJson(this);

  SpareList toModel() {
    return SpareList(
      id: id ?? -1,
      ticketNo: ticketNo ?? -1,
      itemId: itemId ?? -1,
      name: name ?? '',
      quantity: quantity ?? 0,
      rate: rate ?? 0,
      discount: discount ?? 0,
      gross: gross ?? 0,
      net: net ?? 0,
      gst: gst ?? 0,
      total: total ?? 0,
      status: status ?? '',
      createdBy: createdBy ?? -1,
      createdDate: createdDate ?? '',
    );
  }
}
