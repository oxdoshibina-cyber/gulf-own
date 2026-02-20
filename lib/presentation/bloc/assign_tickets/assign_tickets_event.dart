part of 'assign_tickets_bloc.dart';

sealed class AssignTicketsEvent extends Equatable {
  const AssignTicketsEvent();

  @override
  List<Object> get props => [];
}

class GetAllTicketsEvent extends AssignTicketsEvent {
  final String status;
  const GetAllTicketsEvent({required this.status});

  @override
  List<Object> get props => [status];
}

class GetTicketByIdEvent extends AssignTicketsEvent {
  final GetTicketsByIdReqModel id;

  const GetTicketByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class AssignTechnicianEvent extends AssignTicketsEvent {
  final AssignTechnicianReqModel assignTechnicianReqModel;

  const AssignTechnicianEvent({required this.assignTechnicianReqModel});

  @override
  List<Object> get props => [assignTechnicianReqModel];
}

class SearchTechnicianEvent extends AssignTicketsEvent {
  final String query;
  const SearchTechnicianEvent(this.query);

  @override
  List<Object> get props => [query];
}

class SearchTicketEvent extends AssignTicketsEvent {
  final String query;
  const SearchTicketEvent(this.query);

  @override
  List<Object> get props => [query];
}
