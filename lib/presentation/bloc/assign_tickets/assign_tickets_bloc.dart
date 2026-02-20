import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/assign_technician_req_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_req_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_res_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_res_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/repository/assign_tickets_repository.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';

part 'assign_tickets_event.dart';
part 'assign_tickets_state.dart';

class AssignTicketsBloc extends Bloc<AssignTicketsEvent, AssignTicketsState> {
  final AssignTicketsRepository assignTicketsRepository;
  AssignTicketsBloc(this.assignTicketsRepository)
    : super(
        AssignTicketsState(
          getTicketsResModel: [],
          getTicketsByIdReqModel: GetTicketsByIdReqModel.dummy(),
          getTicketsByIdResModel: GetTicketsByIdResModel.dummy(),
          commonResponseModel: CommonResponseModel.dummy(),
          assignTechnicianReqModel: AssignTechnicianReqModel.dummy(),
        ),
      ) {
    on<GetAllTicketsEvent>(_getAllTickets);
    on<GetTicketByIdEvent>(_getTicketById);
    on<AssignTechnicianEvent>(_assignTechnician);
    on<SearchTechnicianEvent>(_searchTechnician);
  }

  void _getAllTickets(
    GetAllTicketsEvent event,
    Emitter<AssignTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedStatus: event.status, // ✅ ADD HERE
        isGetTicketsLoading: true,
        isGetTicketsError: false,
        isGetTicketsSuccess: false,
      ),
    );

    final response = await assignTicketsRepository.getTicketList(event.status);

    response.fold(
      (error) => emit(
        state.copyWith(
          isGetTicketsLoading: false,
          isGetTicketsError: true,
          isGetTicketsSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          getTicketsResModel: data,
          isGetTicketsLoading: false,
          isGetTicketsError: false,
          isGetTicketsSuccess: true,
        ),
      ),
    );
  }

  void _getTicketById(
    GetTicketByIdEvent event,
    Emitter<AssignTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        isGetTicketsByIdLoading: true,
        isGetTicketsByIdError: false,
        isGetTicketsByIdSuccess: false,
      ),
    );
    final response = await assignTicketsRepository.getTicketById(event.id);

    response.fold(
      (error) => emit(
        state.copyWith(
          isGetTicketsByIdLoading: false,
          isGetTicketsByIdError: true,
          isGetTicketsByIdSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          getTicketsByIdResModel: data,
          isGetTicketsByIdLoading: false,
          isGetTicketsByIdError: false,
          isGetTicketsByIdSuccess: true,
        ),
      ),
    );
  }

  void _assignTechnician(
    AssignTechnicianEvent event,
    Emitter<AssignTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        isAssignTechnicianLoading: true,
        isAssignTechnicianError: false,
        isAssignTechnicianSuccess: false,
      ),
    );
    final response = await assignTicketsRepository.assignTechnician(
      event.assignTechnicianReqModel,
    );

    response.fold(
      (error) => emit(
        state.copyWith(
          isAssignTechnicianLoading: false,
          isAssignTechnicianError: true,
          isAssignTechnicianSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          commonResponseModel: data,
          isAssignTechnicianLoading: false,
          isAssignTechnicianError: false,
          isAssignTechnicianSuccess: true,
        ),
      ),
    );
  }

  void _searchTechnician(
    SearchTechnicianEvent event,
    Emitter<AssignTicketsState> emit,
  ) {
    log("SEARCH QUERY: ${event.query}");
    emit(state.copyWith(technicianSearch: event.query.toLowerCase()));
  }
}
