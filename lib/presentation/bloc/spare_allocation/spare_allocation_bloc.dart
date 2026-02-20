import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/common/model/common_response_model.dart';
import '../../../domain/spare_allocation/model/get_spare_detailed_res_model.dart';
import '../../../domain/spare_allocation/model/get_spare_request_list_res_model.dart';
import '../../../domain/spare_allocation/repository/spare_allocation_repository.dart';

part 'spare_allocation_event.dart';
part 'spare_allocation_state.dart';

class SpareAllocationBloc extends Bloc<SpareAllocationEvent, SpareAllocationState> {
  final SpareAllocationRepository spareAllocationRepository;

  SpareAllocationBloc(this.spareAllocationRepository) :
        super(SpareAllocationState(
    spareRequestList: const [],
    spareDetails: GetSpareDetailedResponseModel.dummy(),
    commonResponseModel: CommonResponseModel.dummy(),
    isSpareListLoading: false,
    isSpareListError: false,
    isSpareListSuccess: false,
        isSpareDetailsLoading: false,
    isSpareDetailsError: false,
    isSpareDetailsSuccess: false,
  )) {
    on<SpareAllocationEvent>(_getSpareRequestList);
    on<GetSpareDetailedEvent>(_getSpareDetailed);
  }

  Future<void> _getSpareRequestList(
      SpareAllocationEvent event,
      Emitter<SpareAllocationState> emit,
      )async{
    emit(state.copyWith(
      isSpareListLoading: true,
      isSpareListError: false,
      isSpareListSuccess: false,
    ));

    final response = await spareAllocationRepository.getSpareRequestList();

    response.fold(
          (error) => emit(
        state.copyWith(isSpareListLoading: false, isSpareListError: true, isSpareListSuccess: false),
      ),
          (data) => emit(
        state.copyWith(
          spareRequestList: data,
          isSpareListLoading: false,
          isSpareListError: false,
          isSpareListSuccess: true,
        ),
      ),
    );
  }

  Future<void> _getSpareDetailed(
      GetSpareDetailedEvent event,
      Emitter<SpareAllocationState> emit,
      )async{
    emit(state.copyWith(
      isSpareDetailsLoading: true,
      isSpareDetailsError: false,
      isSpareDetailsSuccess: false,

    ));

    final response = await spareAllocationRepository.getSpareDetailed(event.siEntryNo);

    response.fold(
      (err){
        emit(
          state.copyWith(isSpareListLoading: false, isSpareListError: true, isSpareListSuccess: false),
        );
      },
            (success) => emit(
          state.copyWith(
            spareDetails: success,
            isSpareDetailsLoading: false,
            isSpareDetailsError: false,
            isSpareDetailsSuccess: true,
          ) )
    );

  }
}
