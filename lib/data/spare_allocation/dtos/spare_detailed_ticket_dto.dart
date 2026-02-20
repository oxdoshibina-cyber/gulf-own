import 'package:json_annotation/json_annotation.dart';

import '../../../domain/spare_allocation/model/get_spare_detailed_res_model.dart';

part 'spare_detailed_ticket_dto.g.dart';

@JsonSerializable()
class SpareDetailedTicketDto {
  @JsonKey(name: "si_entryno")
  final int? siEntryNo;

  @JsonKey(name: "si_cust_name")
  final String? siCustName;

  @JsonKey(name: "scr_mobile_no")
  final String? scrMobileNo;

  @JsonKey(name: "si_company")
  final String? siCompany;

  @JsonKey(name: "si_model")
  final String? siModel;

  @JsonKey(name: "si_finish")
  final String? siFinish;

  @JsonKey(name: "si_assign_to")
  final int? siAssignTo;

  @JsonKey(name: "Technician")
  final String? technician;

  @JsonKey(name: "EstimateCost")
  final String? estimateCost;

  @JsonKey(name: "si_deliverydate")
  final String? siDeliveryDate;

  SpareDetailedTicketDto({
    required this.siEntryNo,
    required this.siCustName,
    required this.scrMobileNo,
    required this.siCompany,
    required this.siModel,
    required this.siFinish,
    required this.siAssignTo,
    required this.technician,
    required this.estimateCost,
    required this.siDeliveryDate,
  });

  factory SpareDetailedTicketDto.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$SpareDetailedTicketDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SpareDetailedTicketDtoToJson(this);

  /// DTO → Domain
  SpareDetailedTicketModel toModel() {
    return SpareDetailedTicketModel(
      siEntryNo: siEntryNo ?? -1,
      siCustName: siCustName ?? '',
      scrMobileNo: scrMobileNo ?? '',
      siCompany: siCompany ?? '',
      siModel: siModel ?? '',
      siFinish: siFinish ?? '',
      siAssignTo: siAssignTo ?? -1,
      technician: technician ?? '',
      estimateCost: estimateCost ?? '',
      siDeliveryDate: siDeliveryDate ?? '',
    );
  }
}
