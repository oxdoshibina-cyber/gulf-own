// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_work_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkResponseDto _$CompletedWorkResponseDtoFromJson(
  Map<String, dynamic> json,
) => CompletedWorkResponseDto(
  si_entryno: (json['si_entryno'] as num?)?.toInt(),
  si_assign_to: (json['si_assign_to'] as num?)?.toInt(),
  si_qtn_no: json['si_qtn_no'] as String?,
  customerName: json['CustomerName'] as String?,
  mobileNumber: json['Mobile'] as String?,
  assignDate: json['AssignedDate'] as String?,
  deliveryDate: json['DeliveryDate'] as String?,
  brand: json['Brand'] as String?,
  model: json['Model'] as String?,
  completedWorkStatus: json['Status'] as String?,
  technicianName: json['Technician'] as String?,
  estimatedCost: json['EstimateCost'] as String?,
);

Map<String, dynamic> _$CompletedWorkResponseDtoToJson(
  CompletedWorkResponseDto instance,
) => <String, dynamic>{
  'si_entryno': instance.si_entryno,
  'si_assign_to': instance.si_assign_to,
  'si_qtn_no': instance.si_qtn_no,
  'CustomerName': instance.customerName,
  'Mobile': instance.mobileNumber,
  'AssignedDate': instance.assignDate,
  'DeliveryDate': instance.deliveryDate,
  'Brand': instance.brand,
  'Model': instance.model,
  'Status': instance.completedWorkStatus,
  'Technician': instance.technicianName,
  'EstimateCost': instance.estimatedCost,
};
