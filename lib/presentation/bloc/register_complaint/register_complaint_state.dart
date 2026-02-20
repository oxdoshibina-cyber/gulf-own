// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_complaint_bloc.dart';

class RegisterComplaintState extends Equatable {
  final List<GetServiceComplaint> allServiceComplaints;
  final List<GetServiceComplaint> allCustomersList;
  final List<GetServiceComplaint> searchedComplaints;
  final CommonResponseModel commonResponseModel;
  final InsertServiceComplaintReqModel insertServiceComplaintReqModel;
  final List<GetServiceCategory> serviceCategories;
  final String customerSearch;
  final bool isCustomerLoading;
  final bool isCustomerError;
  final bool isCustomerSuccess;
  final bool isComplaintLoading;
  final bool isComplaintError;
  final bool isComplaintSuccess;
  final bool isInsertServiceComplaintLoading;
  final bool isInsertServiceComplaintError;
  final bool isInsertServiceComplaintSuccess;
  final bool isMobileLoading;
  final bool isMobileError;
  final bool isMobileSuccess;
  final bool isCategoryLoading;
  final bool isCategoryError;
  final bool isCategorySuccess;

  const RegisterComplaintState({
    required this.allServiceComplaints,
    required this.allCustomersList,
    required this.searchedComplaints,
    required this.commonResponseModel,
    required this.insertServiceComplaintReqModel,
    required this.serviceCategories,
    this.customerSearch = "",
    this.isCustomerLoading = false,
    this.isCustomerError = false,
    this.isCustomerSuccess = false,
    this.isComplaintLoading = false,
    this.isComplaintError = false,
    this.isComplaintSuccess = false,
    this.isInsertServiceComplaintLoading = false,
    this.isInsertServiceComplaintError = false,
    this.isInsertServiceComplaintSuccess = false,
    this.isMobileLoading = false,
    this.isMobileError = false,
    this.isMobileSuccess = false,
    this.isCategoryLoading = false,
    this.isCategoryError = false,
    this.isCategorySuccess = false,
  });

  @override
  List<Object> get props => [
    allServiceComplaints,
    allCustomersList,
    searchedComplaints,
    commonResponseModel,
    insertServiceComplaintReqModel,
    serviceCategories,
    customerSearch,
    isCustomerLoading,
    isCustomerError,
    isCustomerSuccess,
    isComplaintLoading,
    isComplaintError,
    isComplaintSuccess,
    isInsertServiceComplaintLoading,
    isInsertServiceComplaintError,
    isInsertServiceComplaintSuccess,
    isMobileLoading,
    isMobileError,
    isMobileSuccess,
    isCategoryLoading,
    isCategoryError,
    isCategorySuccess,
  ];

  RegisterComplaintState copyWith({
    List<GetServiceComplaint>? allServiceComplaints,
    List<GetServiceComplaint>? allCustomersList,
    List<GetServiceComplaint>? searchedComplaints,
    CommonResponseModel? commonResponseModel,
    InsertServiceComplaintReqModel? insertServiceComplaintReqModel,
    List<GetServiceCategory>? serviceCategories,
    String? customerSearch,
    bool? isCustomerLoading,
    bool? isCustomerError,
    bool? isCustomerSuccess,
    bool? isComplaintLoading,
    bool? isComplaintError,
    bool? isComplaintSuccess,
    bool? isInsertServiceComplaintLoading,
    bool? isInsertServiceComplaintError,
    bool? isInsertServiceComplaintSuccess,
    bool? isMobileLoading,
    bool? isMobileError,
    bool? isMobileSuccess,
    bool? isCategoryLoading,
    bool? isCategoryError,
    bool? isCategorySuccess,
  }) {
    return RegisterComplaintState(
      allServiceComplaints: allServiceComplaints ?? this.allServiceComplaints,
      allCustomersList: allCustomersList ?? this.allCustomersList,
      searchedComplaints: searchedComplaints ?? this.searchedComplaints,
      commonResponseModel: commonResponseModel ?? this.commonResponseModel,
      insertServiceComplaintReqModel:
          insertServiceComplaintReqModel ?? this.insertServiceComplaintReqModel,
      serviceCategories: serviceCategories ?? this.serviceCategories,
      customerSearch: customerSearch ?? this.customerSearch,
      isCustomerLoading: isCustomerLoading ?? this.isCustomerLoading,
      isCustomerError: isCustomerError ?? this.isCustomerError,
      isCustomerSuccess: isCustomerSuccess ?? this.isCustomerSuccess,
      isComplaintLoading: isComplaintLoading ?? this.isComplaintLoading,
      isComplaintError: isComplaintError ?? this.isComplaintError,
      isComplaintSuccess: isComplaintSuccess ?? this.isComplaintSuccess,
      isInsertServiceComplaintLoading:
          isInsertServiceComplaintLoading ??
          this.isInsertServiceComplaintLoading,
      isInsertServiceComplaintError:
          isInsertServiceComplaintError ?? this.isInsertServiceComplaintError,
      isInsertServiceComplaintSuccess:
          isInsertServiceComplaintSuccess ??
          this.isInsertServiceComplaintSuccess,
      isMobileLoading: isMobileLoading ?? this.isMobileLoading,
      isMobileError: isMobileError ?? this.isMobileError,
      isMobileSuccess: isMobileSuccess ?? this.isMobileSuccess,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      isCategoryError: isCategoryError ?? this.isCategoryError,
      isCategorySuccess: isCategorySuccess ?? this.isCategorySuccess,
    );
  }
}
