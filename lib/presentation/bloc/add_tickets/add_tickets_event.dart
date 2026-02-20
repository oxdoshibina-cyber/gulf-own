part of 'add_tickets_bloc.dart';

sealed class AddTicketsEvent extends Equatable {
  const AddTicketsEvent();

  @override
  List<Object> get props => [];
}

class GetServiceBrandEvent extends AddTicketsEvent {
  const GetServiceBrandEvent();

  @override
  List<Object> get props => [];
}

class InsertTicketEvent extends AddTicketsEvent {
  final InsertTicketReqModel insertTicketReqModel;

  const InsertTicketEvent({required this.insertTicketReqModel});

  @override
  List<Object> get props => [insertTicketReqModel];
}

class GetServiceCashEvent extends AddTicketsEvent {
  const GetServiceCashEvent();

  @override
  List<Object> get props => [];
}

class GetServiceCardEvent extends AddTicketsEvent {
  const GetServiceCardEvent();

  @override
  List<Object> get props => [];
}

class GetDescriptionListEvent extends AddTicketsEvent {
  const GetDescriptionListEvent();

  @override
  List<Object> get props => [];
}

class InsertDescriptionEvent extends AddTicketsEvent {
  final InsertDescriptionReqModel insertDescriptionReqModel;

  const InsertDescriptionEvent({required this.insertDescriptionReqModel});

  @override
  List<Object> get props => [insertDescriptionReqModel];
}

class ResetInsertTicketEvent extends AddTicketsEvent {
  const ResetInsertTicketEvent();
}

