import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_tickets_res_dto.g.dart';

@JsonSerializable()
class GetTicketsDto {
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
  @JsonKey(name: "si_assign_to")
  final int? assignTo;
  @JsonKey(name: "EstimateCost")
  final String? estimateCost;
  @JsonKey(name: "si_deliverydate")
  final String? deliveryDate;
  @JsonKey(name: "si_finish")
  final String? finish;
  @JsonKey(name: "Technician")
  final String? technician;
  @JsonKey(name: "AssignedDate")
  final String? assignedDate;

  GetTicketsDto({
    this.entryNo,
    this.customerName,
    this.mobileNumber,
    this.company,
    this.model,
    this.assignTo,
    this.estimateCost,
    this.deliveryDate,
    this.finish,
    this.technician,
    this.assignedDate,
  });

  factory GetTicketsDto.fromJson(Map<String, dynamic> json) =>
      _$GetTicketsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetTicketsDtoToJson(this);

  GetTicketsResModel toModel() {
    return GetTicketsResModel(
      entryNo: entryNo ?? -1,
      customerName: customerName ?? '',
      mobileNumber: mobileNumber ?? '',
      company: company ?? '',
      model: model ?? '',
      assignTo: assignTo ?? 0,
      estimateCost: estimateCost ?? '',
      deliveryDate: deliveryDate ?? '',
      finish: finish ?? '',
      technician: technician ?? '',
      assignedDate: assignedDate ?? '',
    );
  }
}
