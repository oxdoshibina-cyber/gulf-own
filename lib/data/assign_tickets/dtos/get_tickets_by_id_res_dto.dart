import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_tickets_by_id_res_dto.g.dart';

@JsonSerializable()
class GetTicketsByIdResDto {
  @JsonKey(name: "ticket")
  final TicketDto? ticket;
  @JsonKey(name: "complaint")
  final List<ComplaintDto>? complaints;
  @JsonKey(name: "technicians")
  final List<TechnicianDto>? technicians;

  GetTicketsByIdResDto({
    this.ticket,
    this.complaints,
    this.technicians,
  });

  factory GetTicketsByIdResDto.fromJson(Map<String, dynamic> json) =>
      _$GetTicketsByIdResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetTicketsByIdResDtoToJson(this);

  GetTicketsByIdResModel toModel() {
    return GetTicketsByIdResModel(
      ticket: ticket?.toModel(),
      complaints: complaints?.map((e) => e.toModel()).toList() ?? [],
      technicians: technicians?.map((e) => e.toModel()).toList() ?? [],
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
  @JsonKey(name: "Technician")
  final String? technician;
  @JsonKey(name: "EstimateCost")
  final String? estimateCost;

  TicketDto({
    this.entryNo,
    this.customerName,
    this.mobileNumber,
    this.company,
    this.model,
    this.finish,
    this.assignTo,
    this.technician,
    this.estimateCost,
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
      assignTo: assignTo ?? 0,
      technician: technician ?? '',
      estimateCost: estimateCost ?? '',
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

  ComplaintDto({
    this.itemId,
    this.itemName,
    this.remarks,
  });

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
class TechnicianDto {
  @JsonKey(name: "as_id")
  final int? id;
  @JsonKey(name: "as_name")
  final String? name;
  @JsonKey(name: "as_mob")
  final String? mobile;
  @JsonKey(name: "as_active")
  final int? isActive;
  @JsonKey(name: "WorkCount")
  final int? workCount;
  @JsonKey(name: "TechnicianStatus")
  final String? status;

  TechnicianDto({
    this.id,
    this.name,
    this.mobile,
    this.isActive,
    this.workCount,
    this.status,
  });

  factory TechnicianDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianDtoToJson(this);

  TechnicianModel toModel() {
    return TechnicianModel(
      id: id ?? -1,
      name: name ?? '',
      mobile: mobile ?? '',
      isActive: isActive ?? 0,
      workCount: workCount ?? 0,
      status: status ?? '',
    );
  }
}
