// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_spare_request_list_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpareRequestListResponseDto _$GetSpareRequestListResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetSpareRequestListResponseDto(
  siEntryNo: (json['si_entryno'] as num?)?.toInt(),
  siCustName: json['si_cust_name'] as String?,
  scrMobileNo: json['scr_mobile_no'] as String?,
  siCompany: json['si_company'] as String?,
  siModel: json['si_model'] as String?,
  siFinish: json['si_finish'] as String?,
  siAssignTo: (json['si_assign_to'] as num?)?.toInt(),
  technician: json['Technician'] as String?,
  estimateCost: json['EstimateCost'] as String?,
  siDeliveryDate: json['si_deliverydate'] as String?,
  spareStatus: json['spareStatus'] as String?,
);

Map<String, dynamic> _$GetSpareRequestListResponseDtoToJson(
  GetSpareRequestListResponseDto instance,
) => <String, dynamic>{
  'si_entryno': instance.siEntryNo,
  'si_cust_name': instance.siCustName,
  'scr_mobile_no': instance.scrMobileNo,
  'si_company': instance.siCompany,
  'si_model': instance.siModel,
  'si_finish': instance.siFinish,
  'si_assign_to': instance.siAssignTo,
  'Technician': instance.technician,
  'EstimateCost': instance.estimateCost,
  'si_deliverydate': instance.siDeliveryDate,
  'spareStatus': instance.spareStatus,
};
