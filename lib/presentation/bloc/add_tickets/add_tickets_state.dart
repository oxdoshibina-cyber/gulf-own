// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_tickets_bloc.dart';

class AddTicketsState extends Equatable {
  final List<GetServiceBrandModel> serviceBrands;
  final InsertTicketResModel insertTicketResModel;
  final InsertTicketReqModel insertTicketReqModel;
  final List<GetServiceCashModel> getServiceCash;
  final List<GetServiceCardModel> getServiceCard;
  final List<GetDescriptionListModel> descriptionList;
  final InsertDescriptionReqModel insertDescriptionReqModel;
  final List<InsertDescriptionResModel> insertDescriptionResModel;
  final bool isServiceBrandLoading;
  final bool isServiceBrandError;
  final bool isServiceBrandSuccess;
  final bool isInsertTicketLoading;
  final bool isInsertTicketError;
  final bool isInsertTicketSuccess;
  final bool isGetServiceCashLoading;
  final bool isGetServiceCashError;
  final bool isGetServiceCashSuccess;
  final bool isGetServiceCardLoading;
  final bool isGetServiceCardError;
  final bool isGetServiceCardSuccess;
  final bool isGetDescriptionListLoading;
  final bool isGetDescriptionListError;
  final bool isGetDescriptionListSuccess;
  final bool isInsertDescriptionLoading;
  final bool isInsertDescriptionError;
  final bool isInsertDescriptionSuccess;

  const AddTicketsState({
    required this.serviceBrands,
    required this.insertTicketResModel,
    required this.insertTicketReqModel,
    required this.getServiceCash,
    required this.getServiceCard,
    required this.descriptionList,
    required this.insertDescriptionReqModel,
    required this.insertDescriptionResModel,
    this.isServiceBrandLoading = false,
    this.isServiceBrandError = false,
    this.isServiceBrandSuccess = false,
    this.isInsertTicketLoading = false,
    this.isInsertTicketError = false,
    this.isInsertTicketSuccess = false,
    this.isGetServiceCashLoading = false,
    this.isGetServiceCashError = false,
    this.isGetServiceCashSuccess = false,
    this.isGetServiceCardLoading = false,
    this.isGetServiceCardError = false,
    this.isGetServiceCardSuccess = false,
    this.isGetDescriptionListError = false,
    this.isGetDescriptionListLoading = false,
    this.isGetDescriptionListSuccess = false,
    this.isInsertDescriptionError = false,
    this.isInsertDescriptionLoading = false,
    this.isInsertDescriptionSuccess = false,
  });

  @override
  List<Object?> get props => [
    serviceBrands,
    insertTicketResModel,
    insertTicketReqModel,
    getServiceCash,
    getServiceCard,
    descriptionList,
    insertDescriptionReqModel,
    insertDescriptionResModel,
    isServiceBrandLoading,
    isServiceBrandError,
    isServiceBrandSuccess,
    isInsertTicketLoading,
    isInsertTicketError,
    isInsertTicketSuccess,
    isGetServiceCashLoading,
    isGetServiceCashError,
    isGetServiceCashSuccess,
    isGetServiceCardLoading,
    isGetServiceCardError,
    isGetServiceCardSuccess,
    isGetDescriptionListError,
    isGetDescriptionListLoading,
    isGetDescriptionListSuccess,
    isInsertDescriptionError,
    isInsertDescriptionLoading,
    isInsertDescriptionSuccess,
  ];

  AddTicketsState copyWith({
    List<GetServiceBrandModel>? serviceBrands,
    InsertTicketResModel? insertTicketResModel,
    InsertTicketReqModel? insertTicketReqModel,
    List<GetServiceCashModel>? getServiceCash,
    List<GetServiceCardModel>? getServiceCard,
    List<GetDescriptionListModel>? descriptionList,
    InsertDescriptionReqModel? insertDescriptionReqModel,
    List<InsertDescriptionResModel>? insertDescriptionResModel,
    bool? isServiceBrandLoading,
    bool? isServiceBrandError,
    bool? isServiceBrandSuccess,
    bool? isInsertTicketLoading,
    bool? isInsertTicketError,
    bool? isInsertTicketSuccess,
    bool? isGetServiceCashLoading,
    bool? isGetServiceCashError,
    bool? isGetServiceCashSuccess,
    bool? isGetServiceCardLoading,
    bool? isGetServiceCardError,
    bool? isGetServiceCardSuccess,
    bool? isGetDescriptionListLoading,
    bool? isGetDescriptionListError,
    bool? isGetDescriptionListSuccess,
    bool? isInsertDescriptionLoading,
    bool? isInsertDescriptionError,
    bool? isInsertDescriptionSuccess,
  }) {
    return AddTicketsState(
      serviceBrands: serviceBrands ?? this.serviceBrands,
      insertTicketResModel: insertTicketResModel ?? this.insertTicketResModel,
      insertTicketReqModel: insertTicketReqModel ?? this.insertTicketReqModel,
      getServiceCash: getServiceCash ?? this.getServiceCash,
      getServiceCard: getServiceCard ?? this.getServiceCard,
      descriptionList: descriptionList ?? this.descriptionList,
      insertDescriptionReqModel:
          insertDescriptionReqModel ?? this.insertDescriptionReqModel,
      insertDescriptionResModel:
          insertDescriptionResModel ?? this.insertDescriptionResModel,
      isServiceBrandLoading:
          isServiceBrandLoading ?? this.isServiceBrandLoading,
      isServiceBrandError: isServiceBrandError ?? this.isServiceBrandError,
      isServiceBrandSuccess:
          isServiceBrandSuccess ?? this.isServiceBrandSuccess,
      isInsertTicketLoading:
          isInsertTicketLoading ?? this.isInsertTicketLoading,
      isInsertTicketError: isInsertTicketError ?? this.isInsertTicketError,
      isInsertTicketSuccess:
          isInsertTicketSuccess ?? this.isInsertTicketSuccess,
      isGetServiceCashLoading:
          isGetServiceCashLoading ?? this.isGetServiceCashLoading,
      isGetServiceCashError:
          isGetServiceCashError ?? this.isGetServiceCashError,
      isGetServiceCashSuccess:
          isGetServiceCashSuccess ?? this.isGetServiceCashSuccess,
      isGetServiceCardLoading:
          isGetServiceCardLoading ?? this.isGetServiceCardLoading,
      isGetServiceCardError:
          isGetServiceCardError ?? this.isGetServiceCardError,
      isGetServiceCardSuccess:
          isGetServiceCardSuccess ?? this.isGetServiceCardSuccess,
      isGetDescriptionListLoading:
          isGetDescriptionListLoading ?? this.isGetDescriptionListLoading,
      isGetDescriptionListError:
          isGetDescriptionListError ?? this.isGetDescriptionListError,
      isGetDescriptionListSuccess:
          isGetDescriptionListSuccess ?? this.isGetDescriptionListSuccess,
      isInsertDescriptionLoading:
          isInsertDescriptionLoading ?? this.isInsertDescriptionLoading,
      isInsertDescriptionError:
          isInsertDescriptionError ?? this.isInsertDescriptionError,
      isInsertDescriptionSuccess:
          isInsertDescriptionSuccess ?? this.isInsertDescriptionSuccess,
    );
  }
}
