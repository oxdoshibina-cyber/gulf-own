part of 'completed_work_bloc.dart';


sealed class CompletedWorkEvent extends Equatable{
  const CompletedWorkEvent();

  @override
  List<Object?> get props => [];

}

class GetCompletedWorkListEvent extends CompletedWorkEvent{
  final String fromDate;
  final String toDate;
  final String searchQuery;
  const GetCompletedWorkListEvent({
    required this.fromDate,
    required this.toDate,
    required this.searchQuery,
  });
  @override
  List<Object?> get props => [fromDate, toDate, searchQuery];

}

class GetCompletedWorkDetailsEvent extends CompletedWorkEvent{
  final int workId;
  const GetCompletedWorkDetailsEvent({
    required this.workId,
  });
  @override
  List<Object?> get props => [workId];

}

class InsertServiceReturnEvent extends CompletedWorkEvent{
  final int siEntryNo;
  final int asId;
  final String remarks;
  const InsertServiceReturnEvent({
    required this.siEntryNo,
    required this.asId,
    required this.remarks,
  });
  @override
  List<Object?> get props => [siEntryNo, asId, remarks];

}

