part of 'items_collected_bloc.dart';

class ItemsCollectedState extends Equatable {
  final List<ItemsCollectedResponseModel> itemsCollectedList;
  final CommonResponseModel? commonResponseModel;
  final InsertItemsCollectedReqModel? insertItemsCollectedReqModel;
  final InsertItemsCollectedReqModel? updateItemsCollectedReqModel;
  final ItemsCollectedResponseModel? collectedItem;
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool isFetchIdLoading;
  final bool isFetchIdError;
  final bool isFetchIdSuccess;
  final bool isUpdateLoading;
  final bool isUpdateError;
  final bool isUpdateSuccess;
  final bool isDeleteIcLoading;
  final bool isDeleteIcError;
  final bool isDeleteIcSuccess;

  const ItemsCollectedState({
    required this.itemsCollectedList,
    required this.commonResponseModel,
    required this.insertItemsCollectedReqModel,
    required this.updateItemsCollectedReqModel,
    required this.collectedItem,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.isUpdateLoading = false,
    this.isUpdateError = false,
    this.isUpdateSuccess = false,
    this.isFetchIdLoading = false,
    this.isFetchIdError = false,
    this.isFetchIdSuccess = false,
    this.isDeleteIcLoading = false,
    this.isDeleteIcError = false,
    this.isDeleteIcSuccess = false,
  });


  @override
  List<Object?> get props => [
    itemsCollectedList,
    commonResponseModel,
    insertItemsCollectedReqModel,
    updateItemsCollectedReqModel,
    collectedItem,
    isLoading,
    isError,
    isSuccess,
    isUpdateLoading,
    isUpdateError,
    isUpdateSuccess,
    isFetchIdLoading,
    isFetchIdError,
    isFetchIdSuccess,
    isDeleteIcLoading,
    isDeleteIcError,
    isDeleteIcSuccess,
  ];


  ItemsCollectedState copyWith({
    List<ItemsCollectedResponseModel>? itemsCollectedList,
    CommonResponseModel? commonResponseModel,
    InsertItemsCollectedReqModel? insertItemsCollectedReqModel,
    InsertItemsCollectedReqModel? updateItemsCollectedReqModel,
    ItemsCollectedResponseModel? collectedItem,
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
    bool? isUpdateLoading,
    bool? isUpdateError,
    bool? isUpdateSuccess,
    bool? isFetchIdLoading,
    bool? isFetchIdError,
    bool? isFetchIdSuccess,
    bool? isDeleteIcLoading,
    bool? isDeleteIcError,
    bool? isDeleteIcSuccess,
  }) {
    return ItemsCollectedState(
        itemsCollectedList: itemsCollectedList ?? this.itemsCollectedList,
        commonResponseModel: commonResponseModel ?? this.commonResponseModel,
        insertItemsCollectedReqModel: insertItemsCollectedReqModel ?? this.insertItemsCollectedReqModel,
        updateItemsCollectedReqModel: updateItemsCollectedReqModel ?? this.updateItemsCollectedReqModel,
        collectedItem: collectedItem ?? this.collectedItem,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        isSuccess: isSuccess ?? this.isSuccess,
        isUpdateLoading: isUpdateLoading ?? this.isUpdateLoading,
        isUpdateError: isUpdateError ?? this.isUpdateError,
        isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      isFetchIdLoading: isFetchIdLoading ?? this.isFetchIdLoading,
      isFetchIdError: isFetchIdError ?? this.isFetchIdError,
      isFetchIdSuccess: isFetchIdSuccess ?? this.isFetchIdSuccess,
      isDeleteIcLoading: isDeleteIcLoading ?? this.isDeleteIcLoading,
      isDeleteIcError: isDeleteIcError ?? this.isDeleteIcError,
      isDeleteIcSuccess: isDeleteIcSuccess ?? this.isDeleteIcSuccess,
    );
  }
}
