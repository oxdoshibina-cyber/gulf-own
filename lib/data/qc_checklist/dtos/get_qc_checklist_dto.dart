import 'package:gulfownsalesview/domain/qc_checklist/model/get_qc_checklist_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_qc_checklist_dto.g.dart';

@JsonSerializable()
class GetQcChecklistDto {
  @JsonKey(name: "qc_id")
  final int? qcId;
  @JsonKey(name: "qc_name")
  final String? qcName;
  @JsonKey(name: "qc_category_id")
  final int? qcCategoryId;
  @JsonKey(name: "CategoryName")
  final String? qcCategoryName;
  @JsonKey(name: "qc_is_active")
  final bool? qcIsActive;
  @JsonKey(name: "created_by")
  final int? createdBy;
  @JsonKey(name: "created_date")
  final String? createdDate;
  @JsonKey(name: "updated_by")
  final int? updatedBy;
  @JsonKey(name: "updated_date")
  final String? updatedDate;

  GetQcChecklistDto({
    this.qcId,
    this.qcName,
    this.qcCategoryId,
    this.qcCategoryName,
    this.qcIsActive,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory GetQcChecklistDto.fromJson(Map<String, dynamic> json) =>
      _$GetQcChecklistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetQcChecklistDtoToJson(this);

  GetQcChecklistModel toModel() {
    return GetQcChecklistModel(
      qcId: qcId ?? -1,
      qcName: qcName ?? '',
      qcCategoryId: qcCategoryId ?? -1,
      qcCategory: qcCategoryName ?? '',
      qcIsActive: qcIsActive ?? false,
      createdBy: createdBy ?? -1,
      createdDate: createdDate ?? '',
      updatedBy: updatedBy ?? -1,
      updatedDate: updatedDate ?? "",
    );
  }
}
