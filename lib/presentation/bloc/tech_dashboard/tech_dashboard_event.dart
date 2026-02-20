part of 'tech_dashboard_bloc.dart';

sealed class TechDashboardEvent extends Equatable {
  const TechDashboardEvent();

  @override
  List<Object> get props => [];
}

class TechnicianDashboardEvent extends TechDashboardEvent {
  final int id;
  const TechnicianDashboardEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class SpareListEvent extends TechDashboardEvent {
  const SpareListEvent();
  @override
  List<Object> get props => [];
}

class SparePartHistoryEvent extends TechDashboardEvent {
  final int id;
  const SparePartHistoryEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class UpdateTechnicianEvent extends TechDashboardEvent {
  final ResponseType status;
  final String remarks;

  const UpdateTechnicianEvent(this.status, {this.remarks = ''});

  @override
  List<Object> get props => [status, remarks];
}

class RelocateTechnicianEvent extends TechDashboardEvent {
  final RelocateTechnicianReqModel relocateTechnicianReqModel;
  const RelocateTechnicianEvent({required this.relocateTechnicianReqModel});

  @override
  List<Object> get props => [relocateTechnicianReqModel];
}

class InsertSpareEvent extends TechDashboardEvent {
  final InsertSpareReqModel insertSpareReqModel;
  const InsertSpareEvent({required this.insertSpareReqModel});
  @override
  List<Object> get props => [insertSpareReqModel];
}

class ProductDetailsEvent extends TechDashboardEvent {
  final int id;
  const ProductDetailsEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class SelectSpareEvent extends TechDashboardEvent {
  final SpareListModel spare;
  const SelectSpareEvent(this.spare);

  @override
  List<Object> get props => [spare];
}

class SelectProductBatchEvent extends TechDashboardEvent {
  final ProductDetailsResModel product;
  const SelectProductBatchEvent(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateQtyEvent extends TechDashboardEvent {
  final int qty;
  const UpdateQtyEvent(this.qty);
  @override
  List<Object> get props => [qty];
}

class UpdateRateEvent extends TechDashboardEvent {
  final double rate;
  const UpdateRateEvent(this.rate);
  @override
  List<Object> get props => [rate];
}

class UpdateDiscountEvent extends TechDashboardEvent {
  final double discount;
  const UpdateDiscountEvent(this.discount);
  @override
  List<Object> get props => [discount];
}

class ResetSpareEntryEvent extends TechDashboardEvent {
  const ResetSpareEntryEvent();
}

class StartTimerEvent extends TechDashboardEvent {
  const StartTimerEvent();
  @override
  List<Object> get props => [];
}

class StopTimerEvent extends TechDashboardEvent {
  const StopTimerEvent();
  @override
  List<Object> get props => [];
}

class TickTimerEvent extends TechDashboardEvent {
  const TickTimerEvent();
  @override
  List<Object> get props => [];
}
