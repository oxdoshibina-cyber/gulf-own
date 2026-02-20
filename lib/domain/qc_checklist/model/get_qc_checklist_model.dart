// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class GetQcChecklistModel extends Equatable {
  final int qcId;
  final String qcName;
  final int qcCategoryId;
  final String qcCategory;
  final bool qcIsActive;
  final int createdBy;
  final String createdDate;
  final int updatedBy;
  final String updatedDate;

  const GetQcChecklistModel({
    required this.qcId,
    required this.qcName,
    required this.qcCategoryId,
    required this.qcCategory,
    required this.qcIsActive,
    required this.createdBy,
    required this.createdDate,
    required this.updatedBy,
    required this.updatedDate,
  });

  factory GetQcChecklistModel.dummy() => const GetQcChecklistModel(
    qcId: -1,
    qcName: '',
    qcCategoryId: -1,
    qcCategory: '',
    qcIsActive: false,
    createdBy: -1,
    createdDate: '',
    updatedBy: -1,
    updatedDate: '',
  );
  @override
  List<Object?> get props => [
    qcId,
    qcName,
    qcCategoryId,
    qcCategory,
    qcIsActive,
    createdBy,
    createdDate,
    updatedBy,
    updatedDate,
  ];

  GetQcChecklistModel copyWith({
    int? qcId,
    String? qcName,
    int? qcCategoryId,
    String? qcCategory,
    bool? qcIsActive,
    int? createdBy,
    String? createdDate,
    int? updatedBy,
    String? updatedDate,
  }) {
    return GetQcChecklistModel(
      qcId: qcId ?? this.qcId,
      qcName: qcName ?? this.qcName,
      qcCategoryId: qcCategoryId ?? this.qcCategoryId,
      qcCategory: qcCategory ?? this.qcCategory,
      qcIsActive: qcIsActive ?? this.qcIsActive,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }
}
