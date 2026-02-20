// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'assign_tickets_bloc.dart';

class AssignTicketsState extends Equatable {
  final List<GetTicketsResModel> getTicketsResModel;
  final GetTicketsByIdReqModel getTicketsByIdReqModel;
  final GetTicketsByIdResModel getTicketsByIdResModel;
  final CommonResponseModel commonResponseModel;
  final AssignTechnicianReqModel assignTechnicianReqModel;
  final String selectedStatus;
  final String technicianSearch;
  final bool isGetTicketsLoading;
  final bool isGetTicketsError;
  final bool isGetTicketsSuccess;
  final bool isGetTicketsByIdLoading;
  final bool isGetTicketsByIdError;
  final bool isGetTicketsByIdSuccess;
  final bool isAssignTechnicianLoading;
  final bool isAssignTechnicianError;
  final bool isAssignTechnicianSuccess;

  const AssignTicketsState({
    required this.getTicketsResModel,
    required this.getTicketsByIdReqModel,
    required this.getTicketsByIdResModel,
    required this.commonResponseModel,
    required this.assignTechnicianReqModel,
    this.selectedStatus = "Unassigned",
    this.technicianSearch = "",
    this.isGetTicketsLoading = false,
    this.isGetTicketsError = false,
    this.isGetTicketsSuccess = false,
    this.isGetTicketsByIdLoading = false,
    this.isGetTicketsByIdError = false,
    this.isGetTicketsByIdSuccess = false,
    this.isAssignTechnicianLoading = false,
    this.isAssignTechnicianError = false,
    this.isAssignTechnicianSuccess = false,
  });

  @override
  List<Object?> get props => [
    getTicketsResModel,
    getTicketsByIdReqModel,
    getTicketsByIdResModel,
    commonResponseModel,
    assignTechnicianReqModel,
    selectedStatus,
    technicianSearch,
    isGetTicketsLoading,
    isGetTicketsError,
    isGetTicketsSuccess,
    isGetTicketsByIdLoading,
    isGetTicketsByIdError,
    isGetTicketsByIdSuccess,
    isAssignTechnicianLoading,
    isAssignTechnicianError,
    isAssignTechnicianSuccess,
  ];

  AssignTicketsState copyWith({
    List<GetTicketsResModel>? getTicketsResModel,
    GetTicketsByIdReqModel? getTicketsByIdReqModel,
    GetTicketsByIdResModel? getTicketsByIdResModel,
    CommonResponseModel? commonResponseModel,
    AssignTechnicianReqModel? assignTechnicianReqModel,
    String? selectedStatus,
    String? technicianSearch,
    bool? isGetTicketsLoading,
    bool? isGetTicketsError,
    bool? isGetTicketsSuccess,
    bool? isGetTicketsByIdLoading,
    bool? isGetTicketsByIdError,
    bool? isGetTicketsByIdSuccess,
    bool? isAssignTechnicianLoading,
    bool? isAssignTechnicianError,
    bool? isAssignTechnicianSuccess,
  }) {
    return AssignTicketsState(
      getTicketsResModel: getTicketsResModel ?? this.getTicketsResModel,
      getTicketsByIdReqModel:
          getTicketsByIdReqModel ?? this.getTicketsByIdReqModel,
      getTicketsByIdResModel:
          getTicketsByIdResModel ?? this.getTicketsByIdResModel,
      commonResponseModel: commonResponseModel ?? this.commonResponseModel,
      assignTechnicianReqModel:
          assignTechnicianReqModel ?? this.assignTechnicianReqModel,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      technicianSearch: technicianSearch ?? this.technicianSearch,
      isGetTicketsLoading: isGetTicketsLoading ?? this.isGetTicketsLoading,
      isGetTicketsError: isGetTicketsError ?? this.isGetTicketsError,
      isGetTicketsSuccess: isGetTicketsSuccess ?? this.isGetTicketsSuccess,
      isGetTicketsByIdLoading:
          isGetTicketsByIdLoading ?? this.isGetTicketsByIdLoading,
      isGetTicketsByIdError:
          isGetTicketsByIdError ?? this.isGetTicketsByIdError,
      isGetTicketsByIdSuccess:
          isGetTicketsByIdSuccess ?? this.isGetTicketsByIdSuccess,
      isAssignTechnicianLoading:
          isAssignTechnicianLoading ?? this.isAssignTechnicianLoading,
      isAssignTechnicianError:
          isAssignTechnicianError ?? this.isAssignTechnicianError,
      isAssignTechnicianSuccess:
          isAssignTechnicianSuccess ?? this.isAssignTechnicianSuccess,
    );
  }
}
