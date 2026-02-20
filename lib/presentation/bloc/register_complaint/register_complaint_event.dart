part of 'register_complaint_bloc.dart';

sealed class RegisterComplaintEvent extends Equatable {
  const RegisterComplaintEvent();

  @override
  List<Object> get props => [];
}

class GetAllServiceComplaintEvent extends RegisterComplaintEvent {
  const GetAllServiceComplaintEvent();

  @override
  List<Object> get props => [];
}

class GetAllCustomersEvent extends RegisterComplaintEvent {
  const GetAllCustomersEvent();

  @override
  List<Object> get props => [];
}

class InsertServiceComplaintEvent extends RegisterComplaintEvent {
  final InsertServiceComplaintReqModel insertServiceComplaintReqModel;

  const InsertServiceComplaintEvent({
    required this.insertServiceComplaintReqModel,
  });

  @override
  List<Object> get props => [insertServiceComplaintReqModel];
}

class RegisterComplaintByMobileEvent extends RegisterComplaintEvent {
  final String mobileNo;

  const RegisterComplaintByMobileEvent({required this.mobileNo});

  @override
  List<Object> get props => [mobileNo];
}

class GetServiceCategoryEvent extends RegisterComplaintEvent {
  const GetServiceCategoryEvent();

  @override
  List<Object> get props => [];
}

class SearchCustomerEvent extends RegisterComplaintEvent {
  final String query;
  const SearchCustomerEvent(this.query);

  @override
  List<Object> get props => [query];
}


