// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_complaint_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceComplaintDto _$GetServiceComplaintDtoFromJson(
  Map<String, dynamic> json,
) => GetServiceComplaintDto(
  scrId: (json['scr_id'] as num?)?.toInt(),
  scrTokenNo: (json['scr_token_no'] as num?)?.toInt(),
  scrTokenDate: json['scr_token_date'] as String?,
  scrCustomerName: json['scr_customer_name'] as String?,
  scrMobileNo: json['scr_mobile_no'] as String?,
  scrEmail: json['scr_email'] as String?,
  scrContactNo: json['scr_contact_no'] as String?,
  scrCategoryId: (json['scr_category_id'] as num?)?.toInt(),
  scrCustomerAddress: json['scr_customer_address'] as String?,
  scrFindings: json['scr_findings'] as String?,
  srcIsLedger: json['scr_is_ledger'] as bool?,
  srcLedgerId: (json['scr_ledger_id'] as num?)?.toInt(),
  scrCreatedDate: json['scr_created_date'] as String?,
  scrCreatedBy: (json['scr_created_by'] as num?)?.toInt(),
  scrUpdatedDate: json['scr_updated_date'] as String?,
  scrUpdatedBy: json['scr_updated_by'] as String?,
);

Map<String, dynamic> _$GetServiceComplaintDtoToJson(
  GetServiceComplaintDto instance,
) => <String, dynamic>{
  'scr_id': instance.scrId,
  'scr_token_no': instance.scrTokenNo,
  'scr_token_date': instance.scrTokenDate,
  'scr_customer_name': instance.scrCustomerName,
  'scr_mobile_no': instance.scrMobileNo,
  'scr_email': instance.scrEmail,
  'scr_contact_no': instance.scrContactNo,
  'scr_category_id': instance.scrCategoryId,
  'scr_customer_address': instance.scrCustomerAddress,
  'scr_findings': instance.scrFindings,
  'scr_is_ledger': instance.srcIsLedger,
  'scr_ledger_id': instance.srcLedgerId,
  'scr_created_date': instance.scrCreatedDate,
  'scr_created_by': instance.scrCreatedBy,
  'scr_updated_date': instance.scrUpdatedDate,
  'scr_updated_by': instance.scrUpdatedBy,
};
