part of 'spare_allocation_bloc.dart';

class SpareAllocationState extends Equatable{
  final List<GetSpareRequestListResponseModel> spareRequestList;
  final GetSpareDetailedResponseModel spareDetails;
  final CommonResponseModel? commonResponseModel;
  final bool isSpareListLoading;
  final bool isSpareListError;
  final bool isSpareListSuccess;
  final bool isSpareDetailsLoading;
  final bool isSpareDetailsError;
  final bool isSpareDetailsSuccess;

  const SpareAllocationState({
    required this.spareRequestList,
    required this.spareDetails,
    required this.commonResponseModel,
    this.isSpareListLoading = false,
    this.isSpareListError = false,
    this.isSpareListSuccess = false,
    this.isSpareDetailsLoading = false,
    this.isSpareDetailsError = false,
    this.isSpareDetailsSuccess = false,

  });
  @override
  List<Object?> get props => [
    spareRequestList,
    spareDetails,
    commonResponseModel,
    isSpareListLoading,
    isSpareListError,
    isSpareListSuccess,
    isSpareDetailsLoading,
    isSpareDetailsError,
    isSpareDetailsSuccess,
  ];

  SpareAllocationState copyWith({
    List<GetSpareRequestListResponseModel>? spareRequestList,
    GetSpareDetailedResponseModel? spareDetails,
    CommonResponseModel? commonResponseModel,
    bool? isSpareListLoading,
    bool? isSpareListError,
    bool? isSpareListSuccess,
    bool? isSpareDetailsLoading,
    bool? isSpareDetailsError,
    bool? isSpareDetailsSuccess,
  }){
    return SpareAllocationState(
      spareRequestList: spareRequestList ?? this.spareRequestList,
      spareDetails: spareDetails ?? this.spareDetails,
      commonResponseModel: commonResponseModel ?? this.commonResponseModel,
      isSpareListLoading: isSpareListLoading ?? this.isSpareListLoading,
        isSpareListError: isSpareListError ?? this.isSpareListError,
        isSpareListSuccess: isSpareListSuccess ?? this.isSpareListSuccess,
      isSpareDetailsLoading: isSpareDetailsLoading ?? this.isSpareDetailsLoading,
      isSpareDetailsError: isSpareDetailsError ?? this.isSpareDetailsError,
      isSpareDetailsSuccess: isSpareDetailsSuccess ?? this.isSpareDetailsSuccess,
    );
  }
}
