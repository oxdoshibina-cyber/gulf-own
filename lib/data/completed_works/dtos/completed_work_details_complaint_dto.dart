import 'package:json_annotation/json_annotation.dart';

import '../../../domain/completed_works/model/completed_work_details_res_model.dart';

part 'completed_work_details_complaint_dto.g.dart';

@JsonSerializable()
class CompletedWorkComplaintDto {
  @JsonKey(name: "li_ir_id")
  final int? liIrId;

  @JsonKey(name: "ir_name")
  final String? irName;

  @JsonKey(name: "li_remarks")
  final String? liRemarks;

  CompletedWorkComplaintDto({
    required this.liIrId,
    required this.irName,
    required this.liRemarks,
  });

  factory CompletedWorkComplaintDto.fromJson(
      Map<String, dynamic> json) =>
      _$CompletedWorkComplaintDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompletedWorkComplaintDtoToJson(this);

  CompletedWorkComplaintModel toModel() {
    return CompletedWorkComplaintModel(
      liIrId: liIrId ?? -1,
      irName: irName ?? '',
      liRemarks: liRemarks ?? '',
    );
  }
}
