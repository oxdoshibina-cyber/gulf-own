part of 'completed_work_bloc.dart';


class CompletedWorkState extends Equatable {
  final List<CompletedWorkResponseModel> completedWorkList;
  final CompletedWorkDetailsResponseModel? completedWorkDetails;
  final ServiceReturnResponseModel? serviceReturns;
  final CommonResponseModel? commonResponseModel;
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool isDetailsLoading;
  final bool isDetailsError;
  final bool isDetailsSuccess;
  final bool isServiceReturnLoading;
  final bool isServiceReturnError;
  final bool isServiceReturnSuccess;
  final String searchQuery;

  const CompletedWorkState({
    required this.completedWorkList,
    required this.completedWorkDetails,
    required this.serviceReturns,
    required this.commonResponseModel,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.isDetailsLoading = false,
    this.isDetailsError = false,
    this.isDetailsSuccess = false,
    this.isServiceReturnLoading = false,
    this.isServiceReturnError = false,
    this.isServiceReturnSuccess = false,
    this.searchQuery = "",
  });

  @override
  List<Object?> get props => [
    completedWorkList,
    completedWorkDetails,
    serviceReturns,
    commonResponseModel,
    isLoading,
    isError,
    isSuccess,
    isDetailsLoading,
    isDetailsError,
    isDetailsSuccess,
    isServiceReturnLoading,
    isServiceReturnError,
    isServiceReturnSuccess,
    searchQuery,
  ];

  CompletedWorkState copyWith({
    List<CompletedWorkResponseModel>? completedWorkList,
    CompletedWorkDetailsResponseModel? completedWorkDetails,
    ServiceReturnResponseModel? serviceReturns,
    CommonResponseModel? commonResponseModel,
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
    bool? isDetailsLoading,
    bool? isDetailsError,
    bool? isDetailsSuccess,
    bool? isServiceReturnLoading,
    bool? isServiceReturnError,
    bool? isServiceReturnSuccess,
    String? searchQuery,
  }){
    return CompletedWorkState(
      completedWorkList: completedWorkList ?? this.completedWorkList,
      completedWorkDetails: completedWorkDetails ?? this.completedWorkDetails,
        serviceReturns: serviceReturns ?? this.serviceReturns,
        commonResponseModel: commonResponseModel ?? this.commonResponseModel,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        isSuccess: isSuccess ?? this.isSuccess,
        isDetailsLoading: isDetailsLoading ?? this.isDetailsLoading,
        isDetailsError: isDetailsError ?? this.isDetailsError,
        isDetailsSuccess: isDetailsSuccess ?? this.isDetailsSuccess,
        isServiceReturnLoading: isServiceReturnLoading ?? this.isServiceReturnLoading,
        isServiceReturnError: isServiceReturnError ?? this.isServiceReturnError,
        isServiceReturnSuccess: isServiceReturnSuccess ?? this.isServiceReturnSuccess,
        searchQuery: searchQuery ?? this.searchQuery,
    );
  }


}