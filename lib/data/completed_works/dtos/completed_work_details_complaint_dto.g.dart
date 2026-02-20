// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_work_details_complaint_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkComplaintDto _$CompletedWorkComplaintDtoFromJson(
  Map<String, dynamic> json,
) => CompletedWorkComplaintDto(
  liIrId: (json['li_ir_id'] as num?)?.toInt(),
  irName: json['ir_name'] as String?,
  liRemarks: json['li_remarks'] as String?,
);

Map<String, dynamic> _$CompletedWorkComplaintDtoToJson(
  CompletedWorkComplaintDto instance,
) => <String, dynamic>{
  'li_ir_id': instance.liIrId,
  'ir_name': instance.irName,
  'li_remarks': instance.liRemarks,
};
