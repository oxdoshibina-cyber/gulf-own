part of 'spare_allocation_bloc.dart';

@immutable
sealed class SpareAllocationEvent extends Equatable{
  const SpareAllocationEvent();

  @override
  List<Object?> get props => [];
}

class GetSpareRequestListEvent extends SpareAllocationEvent{
  const GetSpareRequestListEvent();

  @override
  List<Object?> get props => [];
}

class GetSpareDetailedEvent extends SpareAllocationEvent{
  final int siEntryNo;

  const GetSpareDetailedEvent(this.siEntryNo);
  @override
  List<Object?> get props => [siEntryNo];
}


