import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/get_qc_checklist_model.dart';

class InsertUpdateQcChecklistReqModel extends Equatable {
  final int qcId;
  final String qcName;
  final int qcCategoryId;
  final bool qcIsActive;
  final int createdBy;
  final int updatedBy;

  const InsertUpdateQcChecklistReqModel({
    required this.qcId,
    required this.qcName,
    required this.qcCategoryId,
    required this.qcIsActive,
    required this.createdBy,
    required this.updatedBy,
  });

  @override
  List<Object?> get props => [
    qcId,
    qcName,
    qcCategoryId,
    qcIsActive,
    createdBy,
    updatedBy,
  ];

  Map<String, dynamic> toMap() {
    return {
      "qc_id": qcId,
      "qc_name": qcName,
      "qc_category_id": qcCategoryId,
      "qc_is_active": qcIsActive,
      "created_by": createdBy,
      "updated_by": updatedBy,
    };
  }

  factory InsertUpdateQcChecklistReqModel.fromGetModel(
    GetQcChecklistModel model,
  ) {
    return InsertUpdateQcChecklistReqModel(
      qcId: model.qcId,
      qcName: model.qcName,
      qcCategoryId: model.qcCategoryId,
      qcIsActive: model.qcIsActive,
      createdBy: 0,
      updatedBy: 0,
    );
  }

  factory InsertUpdateQcChecklistReqModel.dummy() {
    return const InsertUpdateQcChecklistReqModel(
      qcId: -1,
      qcName: '',
      qcCategoryId: -1,
      qcIsActive: true,
      createdBy: -1,
      updatedBy: -1,
    );
  }

  InsertUpdateQcChecklistReqModel copyWith({
    int? qcId,
    String? qcName,
    int? qcCategoryId,
    bool? qcIsActive,
    int? createdBy,
    int? updatedBy,
  }) {
    return InsertUpdateQcChecklistReqModel(
      qcId: qcId ?? this.qcId,
      qcName: qcName ?? this.qcName,
      qcCategoryId: qcCategoryId ?? this.qcCategoryId,
      qcIsActive: qcIsActive ?? this.qcIsActive,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
    );
  }
}
