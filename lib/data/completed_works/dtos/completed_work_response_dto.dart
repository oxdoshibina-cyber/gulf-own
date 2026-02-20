import 'package:json_annotation/json_annotation.dart';

import '../../../domain/completed_works/model/completed_work_res_model.dart';

part 'completed_work_response_dto.g.dart';

@JsonSerializable()
class CompletedWorkResponseDto {
  @JsonKey(name: 'si_entryno')
  final int? si_entryno;

  @JsonKey(name: 'si_assign_to')
  final int? si_assign_to;

  @JsonKey(name: 'si_qtn_no')
  final String? si_qtn_no;

  @JsonKey(name: 'CustomerName')
  final String? customerName;

  @JsonKey(name: 'Mobile')
  final String? mobileNumber;

  @JsonKey(name: 'AssignedDate')
  final String? assignDate;

  @JsonKey(name: 'DeliveryDate')
  final String? deliveryDate;

  @JsonKey(name: 'Brand')
  final String? brand;

  @JsonKey(name: 'Model')
  final String? model;

  @JsonKey(name: 'Status')
  final String? completedWorkStatus;

  @JsonKey(name: 'Technician')
  final String? technicianName;

  @JsonKey(name: 'EstimateCost')
  final String? estimatedCost;

  const CompletedWorkResponseDto({
    required this.si_entryno,
    required this.si_assign_to,
    required this.si_qtn_no,
    required this.customerName,
    required this.mobileNumber,
    required this.assignDate,
    required this.deliveryDate,
    required this.brand,
    required this.model,
    required this.completedWorkStatus,
    required this.technicianName,
    required this.estimatedCost,
  });

  factory CompletedWorkResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CompletedWorkResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompletedWorkResponseDtoToJson(this);

  /// DTO → Domain Model
  CompletedWorkResponseModel toModel() {
    return CompletedWorkResponseModel(
      si_entryno: si_entryno ?? -1,
      si_assign_to: si_assign_to ?? -1,
      si_qtn_no: si_qtn_no ?? '',
      customerName: customerName ?? '',
      mobileNumber: mobileNumber ?? '',
      assignDate: assignDate != null
          ? DateTime.tryParse(assignDate!)
          : DateTime.now(),
      DeliveryDate: deliveryDate != null
          ? DateTime.tryParse(deliveryDate!)
          : DateTime.now(),
      brand: brand ?? '',
      model: model ?? '',
      completedWorkStatus: completedWorkStatus ?? '',
      technicianName: technicianName ?? '',
      estimatedCost: estimatedCost ?? '',
    );
  }
}
