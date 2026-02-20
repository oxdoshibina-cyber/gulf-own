part of 'qc_checklist_bloc.dart';

sealed class QcChecklistEvent extends Equatable {
  const QcChecklistEvent();

  @override
  List<Object> get props => [];
}

class GetAllQcChecklistEvent extends QcChecklistEvent {
  const GetAllQcChecklistEvent();

  @override
  List<Object> get props => [];
}

class InsertQcChecklistEvent extends QcChecklistEvent {
  final InsertUpdateQcChecklistReqModel insertQcChecklistReqModel;

  const InsertQcChecklistEvent({required this.insertQcChecklistReqModel});

  @override
  List<Object> get props => [insertQcChecklistReqModel];
}

class UpdateQcChecklistEvent extends QcChecklistEvent {
  final InsertUpdateQcChecklistReqModel updateQcChecklistReqModel;

  const UpdateQcChecklistEvent({required this.updateQcChecklistReqModel});

  @override
  List<Object> get props => [updateQcChecklistReqModel];
}

class DeleteQcChecklistEvent extends QcChecklistEvent {
  final int qcId;

  const DeleteQcChecklistEvent({required this.qcId});

  @override
  List<Object> get props => [qcId];
}

class FetchQcChecklistByIdEvent extends QcChecklistEvent {
  final int qcId;

  const FetchQcChecklistByIdEvent({required this.qcId});

  @override
  List<Object> get props => [qcId];
}

class ClearFetchQcChecklistFlag extends QcChecklistEvent {
  const ClearFetchQcChecklistFlag();

  @override
  List<Object> get props => [];
}
