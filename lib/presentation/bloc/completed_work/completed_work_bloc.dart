import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/completed_works/model/service_return_res_model.dart';

import '../../../domain/common/model/common_response_model.dart';
import '../../../domain/completed_works/model/completed_work_details_res_model.dart';
import '../../../domain/completed_works/model/completed_work_res_model.dart';
import '../../../domain/completed_works/repository/completed_work_repository.dart';

part 'completed_work_event.dart';
part 'completed_work_state.dart';

class CompletedWorkBloc extends Bloc<CompletedWorkEvent, CompletedWorkState> {
  final CompletedWorkRepository completedWorkRepository;

  CompletedWorkBloc(this.completedWorkRepository) : super(CompletedWorkState(
    completedWorkList: const [],
    completedWorkDetails: CompletedWorkDetailsResponseModel.dummy(),
    serviceReturns: ServiceReturnResponseModel.dummy(),
    commonResponseModel: CommonResponseModel.dummy(),
    isLoading: false,
    isError: false,
    isSuccess: false,
    isDetailsLoading: false,
    isDetailsError: false,
    isDetailsSuccess: false,
    isServiceReturnLoading: false,
    isServiceReturnError: false,
    isServiceReturnSuccess: false,
    searchQuery: "",
  )) {
    on<GetCompletedWorkListEvent>(_getCompletedWorkList);
    on<GetCompletedWorkDetailsEvent>(_getCompletedWorkDetails);
    on<InsertServiceReturnEvent>(_insertServiceReturn);
  }

  Future<void> _getCompletedWorkList(
      GetCompletedWorkListEvent event,
      Emitter<CompletedWorkState> emit,
      ) async {
    emit(state.copyWith(
      isLoading: true,
      isError: false,
      isSuccess: false,
    ));
    final response = await completedWorkRepository.getCompletedWorkList(
      event.fromDate,
      event.toDate,
      event.searchQuery,
    );
    response.fold(
          (error) =>
          emit(
              state.copyWith(
                isLoading: false,
                isError: true,
                isSuccess: false,
              )),
          (data) =>
          emit(
              state.copyWith(
                completedWorkList: data,
                isLoading: false,
                isError: false,
                isSuccess: true,
              )),
    );
  }

  Future<void> _getCompletedWorkDetails(
      GetCompletedWorkDetailsEvent event,
      Emitter<CompletedWorkState> emit,
      ) async {
    emit(state.copyWith(
      isDetailsLoading: true,
      isDetailsError: false,
      isDetailsSuccess: false,
    ));
    final response = await completedWorkRepository.getCompletedWorkDetails(
      event.workId,
    );

    response.fold(
          (error) =>
          emit(
              state.copyWith(
                isDetailsLoading: false,
                isDetailsError: true,
                isDetailsSuccess: false,
              )),
          (data) =>
          emit(
              state.copyWith(
                completedWorkDetails: data,
                isDetailsLoading: false,
                isDetailsError: false,
                isDetailsSuccess: true,
                  )),
    );
  }

  Future<void> _insertServiceReturn(
      InsertServiceReturnEvent event,
      Emitter<CompletedWorkState> emit,
      ) async {
    emit(state.copyWith(
      isServiceReturnLoading: true,
      isServiceReturnError: false,
      isServiceReturnSuccess: false,
    ));
    final response = await completedWorkRepository.insertServiceReturn(
      event.siEntryNo,
      event.asId,
      event.remarks,
    );
    response.fold(
          (error) =>
          emit(
              state.copyWith(
                isServiceReturnLoading: false,
                isServiceReturnError: true,
                isServiceReturnSuccess: false,
              )),
          (data) =>
          emit(
              state.copyWith(
                serviceReturns: data,
                isServiceReturnLoading: false,
                isServiceReturnError: false,
                isServiceReturnSuccess: true,
              )),
    );
  }

}
