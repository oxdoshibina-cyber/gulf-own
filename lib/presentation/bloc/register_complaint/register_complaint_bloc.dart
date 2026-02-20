import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_complaint.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/insert_service_complaint_req_model.dart';
import 'package:gulfownsalesview/domain/register_complaint/repository/register_complaint_repository.dart';

part 'register_complaint_event.dart';
part 'register_complaint_state.dart';

class RegisterComplaintBloc
    extends Bloc<RegisterComplaintEvent, RegisterComplaintState> {
  final RegisterComplaintRepository registerComplaintRepository;
  RegisterComplaintBloc(this.registerComplaintRepository)
    : super(
        RegisterComplaintState(
          allServiceComplaints: const [],
          allCustomersList: const [],
          searchedComplaints: const [],
          commonResponseModel: CommonResponseModel.dummy(),
          insertServiceComplaintReqModel:
              InsertServiceComplaintReqModel.dummy(),
          serviceCategories: const [],
        ),
      ) {
    on<GetAllServiceComplaintEvent>(_getAllServiceComplaint);
    on<GetAllCustomersEvent>(_getAllCustomers);
    on<InsertServiceComplaintEvent>(_insertServiceComplaint);
    on<RegisterComplaintByMobileEvent>(_getServiceComplaintByMobile);
    on<GetServiceCategoryEvent>(_getServiceCategory);
    on<SearchCustomerEvent>(_searchCustomer);
  }

  void _getAllCustomers(
    GetAllCustomersEvent event,
    Emitter<RegisterComplaintState> emit,
  ) async {
    emit(
      state.copyWith(
        isCustomerLoading: true,
        isCustomerError: false,
        isCustomerSuccess: false,
      ),
    );
    final response = await registerComplaintRepository.getAllCustomers();

    response.fold(
      (error) => emit(
        state.copyWith(
          isCustomerLoading: false,
          isCustomerError: true,
          isCustomerSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          isCustomerLoading: false,
          isCustomerError: false,
          isCustomerSuccess: true,
          allCustomersList: data,
        ),
      ),
    );
  }

  void _getAllServiceComplaint(
    GetAllServiceComplaintEvent event,
    Emitter<RegisterComplaintState> emit,
  ) async {
    emit(
      state.copyWith(
        isComplaintLoading: true,
        isComplaintError: false,
        isComplaintSuccess: false,
      ),
    );

    final response = await registerComplaintRepository
        .getServiceComplaintList();

    response.fold(
      (error) => emit(
        state.copyWith(
          isComplaintLoading: false,
          isComplaintError: true,
          isComplaintSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          isComplaintLoading: false,
          isComplaintError: false,
          isComplaintSuccess: true,
          allServiceComplaints: data,
        ),
      ),
    );
  }

  void _insertServiceComplaint(
    InsertServiceComplaintEvent event,
    Emitter<RegisterComplaintState> emit,
  ) async {
    emit(
      state.copyWith(
        isInsertServiceComplaintLoading: true,
        isInsertServiceComplaintError: false,
        isInsertServiceComplaintSuccess: false,
      ),
    );

    final response = await registerComplaintRepository.insertServiceComplaint(
      event.insertServiceComplaintReqModel,
    );

    response.fold(
      (error) => emit(
        state.copyWith(
          isInsertServiceComplaintLoading: false,
          isInsertServiceComplaintError: true,
          isInsertServiceComplaintSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          isInsertServiceComplaintLoading: false,
          isInsertServiceComplaintError: false,
          isInsertServiceComplaintSuccess: true,
          commonResponseModel: data,
        ),
      ),
    );
    add(const GetAllServiceComplaintEvent());
    emit(state.copyWith(searchedComplaints: const []));
  }

  void _getServiceComplaintByMobile(
    RegisterComplaintByMobileEvent event,
    Emitter<RegisterComplaintState> emit,
  ) async {
    // start loading
    emit(state.copyWith(isMobileLoading: true, isMobileError: false));

    final response = await registerComplaintRepository
        .getServiceComplaintMobile(event.mobileNo);

    response.fold(
      (error) {
        emit(
          state.copyWith(
            isMobileLoading: false,
            isMobileError: true,
            searchedComplaints: const [],
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isMobileLoading: false,
            isMobileError: false,
            searchedComplaints: data,
            // ❌ DO NOT set isSuccess here
          ),
        );
      },
    );
  }

  void _getServiceCategory(
    GetServiceCategoryEvent event,
    Emitter<RegisterComplaintState> emit,
  ) async {
    emit(
      state.copyWith(
        isCategoryLoading: true,
        isCategoryError: false,
        isCategorySuccess: false,
      ),
    );

    final response = await registerComplaintRepository.getServiceCategory();
    response.fold(
      (error) => emit(
        state.copyWith(
          isCategoryLoading: false,
          isCategoryError: true,
          isCategorySuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          isCategoryLoading: false,
          isCategoryError: false,
          isCategorySuccess: true,
          serviceCategories: data,
        ),
      ),
    );
  }

  void _searchCustomer(
    SearchCustomerEvent event,
    Emitter<RegisterComplaintState> emit,
  ) {
    emit(state.copyWith(customerSearch: event.query.toLowerCase()));
    // final filtered = state.allServiceComplaints.where(
    //   (e) => e.scrCustomerName.toLowerCase().contains(event.query.toLowerCase()) ||
    //       e.scrMobileNo.toLowerCase().contains(event.query.toLowerCase()) ||
    //       e.scrEmail.toLowerCase().contains(event.query.toLowerCase()) ||
    //       e.scrTokenNo.toString().toLowerCase().contains(event.query.toLowerCase()) ||
    //       e.scrCustomerAddress.toLowerCase().contains(event.query.toLowerCase())
    //
    // );
    // emit(state.copyWith(searchedComplaints: filtered.toList()));
  }
}
