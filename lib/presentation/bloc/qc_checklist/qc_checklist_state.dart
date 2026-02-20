// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'qc_checklist_bloc.dart';

class QcChecklistState extends Equatable {
  final List<GetQcChecklistModel> qcChecklist;
  final InsertUpdateQcChecklistReqModel insertUpdateQcChecklistReqModel;
  final CommonResponseModel commonResponseModel;
  final bool isQcChecklistLoading;
  final bool isQcChecklistError;
  final bool isQcChecklistSuccess;
  final bool isInsertQcChecklistLoading;
  final bool isInsertQcChecklistError;
  final bool isInsertQcChecklistSuccess;
  final bool isUpdateQcChecklistLoading;
  final bool isUpdateQcChecklistError;
  final bool isUpdateQcChecklistSuccess;
  final bool isDeleteQcChecklistLoading;
  final bool isDeleteQcChecklistError;
  final bool isDeleteQcChecklistSuccess;
  final bool isFetchIdLoading;
  final bool isFetchIdError;
  final bool isFetchIdSuccess;

  const QcChecklistState({
    required this.qcChecklist,
    required this.insertUpdateQcChecklistReqModel,
    required this.commonResponseModel,
    this.isQcChecklistLoading = false,
    this.isQcChecklistError = false,
    this.isQcChecklistSuccess = false,
    this.isInsertQcChecklistLoading = false,
    this.isInsertQcChecklistError = false,
    this.isInsertQcChecklistSuccess = false,
    this.isUpdateQcChecklistLoading = false,
    this.isUpdateQcChecklistError = false,
    this.isUpdateQcChecklistSuccess = false,
    this.isDeleteQcChecklistLoading = false,
    this.isDeleteQcChecklistError = false,
    this.isDeleteQcChecklistSuccess = false,
    this.isFetchIdLoading = false,
    this.isFetchIdError = false,
    this.isFetchIdSuccess = false,
  });

  @override
  List<Object?> get props => [
    qcChecklist,
    insertUpdateQcChecklistReqModel,
    commonResponseModel,
    isQcChecklistLoading,
    isQcChecklistError,
    isQcChecklistSuccess,
    isInsertQcChecklistLoading,
    isInsertQcChecklistError,
    isInsertQcChecklistSuccess,
    isUpdateQcChecklistLoading,
    isUpdateQcChecklistError,
    isUpdateQcChecklistSuccess,
    isDeleteQcChecklistLoading,
    isDeleteQcChecklistError,
    isDeleteQcChecklistSuccess,
    isFetchIdLoading,
    isFetchIdError,
    isFetchIdSuccess,
  ];

  QcChecklistState copyWith({
    List<GetQcChecklistModel>? qcChecklist,
    InsertUpdateQcChecklistReqModel? insertUpdateQcChecklistReqModel,
    CommonResponseModel? commonResponseModel,
    bool? isQcChecklistLoading,
    bool? isQcChecklistError,
    bool? isQcChecklistSuccess,
    bool? isInsertQcChecklistLoading,
    bool? isInsertQcChecklistError,
    bool? isInsertQcChecklistSuccess,
    bool? isUpdateQcChecklistLoading,
    bool? isUpdateQcChecklistError,
    bool? isUpdateQcChecklistSuccess,
    bool? isDeleteQcChecklistLoading,
    bool? isDeleteQcChecklistError,
    bool? isDeleteQcChecklistSuccess,
    bool? isFetchIdLoading,
    bool? isFetchIdError,
    bool? isFetchIdSuccess,
  }) {
    return QcChecklistState(
      qcChecklist: qcChecklist ?? this.qcChecklist,
      insertUpdateQcChecklistReqModel:
          insertUpdateQcChecklistReqModel ??
          this.insertUpdateQcChecklistReqModel,
      commonResponseModel: commonResponseModel ?? this.commonResponseModel,
      isQcChecklistLoading: isQcChecklistLoading ?? this.isQcChecklistLoading,
      isQcChecklistError: isQcChecklistError ?? this.isQcChecklistError,
      isQcChecklistSuccess: isQcChecklistSuccess ?? this.isQcChecklistSuccess,
      isInsertQcChecklistLoading:
          isInsertQcChecklistLoading ?? this.isInsertQcChecklistLoading,
      isInsertQcChecklistError:
          isInsertQcChecklistError ?? this.isInsertQcChecklistError,
      isInsertQcChecklistSuccess:
          isInsertQcChecklistSuccess ?? this.isInsertQcChecklistSuccess,
      isUpdateQcChecklistLoading:
          isUpdateQcChecklistLoading ?? this.isUpdateQcChecklistLoading,
      isUpdateQcChecklistError:
          isUpdateQcChecklistError ?? this.isUpdateQcChecklistError,
      isUpdateQcChecklistSuccess:
          isUpdateQcChecklistSuccess ?? this.isUpdateQcChecklistSuccess,
      isDeleteQcChecklistLoading:
          isDeleteQcChecklistLoading ?? this.isDeleteQcChecklistLoading,
      isDeleteQcChecklistError:
          isDeleteQcChecklistError ?? this.isDeleteQcChecklistError,
      isDeleteQcChecklistSuccess:
          isDeleteQcChecklistSuccess ?? this.isDeleteQcChecklistSuccess,
      isFetchIdLoading: isFetchIdLoading ?? this.isFetchIdLoading,
      isFetchIdError: isFetchIdError ?? this.isFetchIdError,
      isFetchIdSuccess: isFetchIdSuccess ?? this.isFetchIdSuccess,
    );
  }
}
