// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_qc_checklist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQcChecklistDto _$GetQcChecklistDtoFromJson(Map<String, dynamic> json) =>
    GetQcChecklistDto(
      qcId: (json['qc_id'] as num?)?.toInt(),
      qcName: json['qc_name'] as String?,
      qcCategoryId: (json['qc_category_id'] as num?)?.toInt(),
      qcCategoryName: json['CategoryName'] as String?,
      qcIsActive: json['qc_is_active'] as bool?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      createdDate: json['created_date'] as String?,
      updatedBy: (json['updated_by'] as num?)?.toInt(),
      updatedDate: json['updated_date'] as String?,
    );

Map<String, dynamic> _$GetQcChecklistDtoToJson(GetQcChecklistDto instance) =>
    <String, dynamic>{
      'qc_id': instance.qcId,
      'qc_name': instance.qcName,
      'qc_category_id': instance.qcCategoryId,
      'CategoryName': instance.qcCategoryName,
      'qc_is_active': instance.qcIsActive,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate,
      'updated_by': instance.updatedBy,
      'updated_date': instance.updatedDate,
    };
