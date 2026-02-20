import 'package:json_annotation/json_annotation.dart';

import '../../../domain/spare_allocation/model/get_spare_request_list_res_model.dart';

part 'get_spare_request_list_res_dto.g.dart';

@JsonSerializable()
class GetSpareRequestListResponseDto {
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

  @JsonKey(name: "spareStatus")
  final String? spareStatus;

  GetSpareRequestListResponseDto({
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
    required this.spareStatus,
  });

  factory GetSpareRequestListResponseDto.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$GetSpareRequestListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSpareRequestListResponseDtoToJson(this);

  /// Converts DTO → Domain Model
  GetSpareRequestListResponseModel toModel() {
    return GetSpareRequestListResponseModel(
      si_entryno: siEntryNo ?? -1,
      si_cust_name: siCustName ?? '',
      scr_mobile_no: scrMobileNo ?? '',
      si_company: siCompany ?? '',
      si_model: siModel ?? '',
      si_finish: siFinish ?? '',
      si_assign_to: siAssignTo ?? -1,
      Technician: technician ?? '',
      EstimateCost: estimateCost ?? '',
      si_deliverydate: siDeliveryDate ?? '',
      spareStatus: spareStatus ?? '',
    );
  }
}
