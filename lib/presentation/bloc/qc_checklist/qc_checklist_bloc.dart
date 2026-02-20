import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/get_qc_checklist_model.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/insert_update_qc_checklist_req_model.dart';
import 'package:gulfownsalesview/domain/qc_checklist/repository/qc_checklist_repository.dart';

part 'qc_checklist_event.dart';
part 'qc_checklist_state.dart';

class QcChecklistBloc extends Bloc<QcChecklistEvent, QcChecklistState> {
  final QcChecklistRepository qcChecklistRepository;
  QcChecklistBloc(this.qcChecklistRepository)
    : super(
        QcChecklistState(
          qcChecklist: [],
          insertUpdateQcChecklistReqModel:
              InsertUpdateQcChecklistReqModel.dummy(),
          commonResponseModel: CommonResponseModel.dummy(),
        ),
      ) {
    on<GetAllQcChecklistEvent>(_getAllQcChecklist);
    on<InsertQcChecklistEvent>(_insertQcChecklist);
    on<UpdateQcChecklistEvent>(_updateQcChecklist);
    on<DeleteQcChecklistEvent>(_deleteQcChecklist);
    on<FetchQcChecklistByIdEvent>(_fetchQcChecklistById);
    on<ClearFetchQcChecklistFlag>(_clearFetchFlag);
  }
  void _getAllQcChecklist(
    GetAllQcChecklistEvent event,
    Emitter<QcChecklistState> emit,
  ) async {
    emit(
      state.copyWith(
        isQcChecklistLoading: true,
        isQcChecklistError: false,
        isQcChecklistSuccess: false,
      ),
    );

    final response = await qcChecklistRepository.getQcCheckList();

    response.fold(
      (error) => emit(
        state.copyWith(
          isQcChecklistLoading: false,
          isQcChecklistError: true,
          isQcChecklistSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          qcChecklist: data,
          isQcChecklistLoading: false,
          isQcChecklistError: false,
          isQcChecklistSuccess: true,
        ),
      ),
    );
  }

  void _insertQcChecklist(
    InsertQcChecklistEvent event,
    Emitter<QcChecklistState> emit,
  ) async {
    emit(
      state.copyWith(
        isInsertQcChecklistLoading: true,
        isInsertQcChecklistError: false,
        isInsertQcChecklistSuccess: false,
      ),
    );

    final response = await qcChecklistRepository.insertQcCheckList(
      event.insertQcChecklistReqModel,
    );

    await response.fold(
      (error) async {
        emit(
          state.copyWith(
            isInsertQcChecklistLoading: false,
            isInsertQcChecklistError: true,
            isInsertQcChecklistSuccess: false,
          ),
        );
      },
      (data) async {
        // ✅ Fetch updated list
        final listResponse = await qcChecklistRepository.getQcCheckList();

        listResponse.fold(
          (error) => emit(
            state.copyWith(
              isInsertQcChecklistLoading: false,
              isInsertQcChecklistError: true,
            ),
          ),
          (list) => emit(
            state.copyWith(
              qcChecklist: List<GetQcChecklistModel>.from(list),
              commonResponseModel: data,
              isQcChecklistError: false,
              isQcChecklistSuccess: true,
              isQcChecklistLoading: false,
              isInsertQcChecklistLoading: false,
              isInsertQcChecklistError: false,
              isInsertQcChecklistSuccess: true,
            ),
          ),
        );
      },
    );
  }

  void _updateQcChecklist(
    UpdateQcChecklistEvent event,
    Emitter<QcChecklistState> emit,
  ) async {
    emit(
      state.copyWith(
        isUpdateQcChecklistLoading: true,
        isUpdateQcChecklistError: false,
        isUpdateQcChecklistSuccess: false,
      ),
    );

    final response = await qcChecklistRepository.updateQcCheckList(
      event.updateQcChecklistReqModel,
    );

    response.fold(
      (error) => emit(
        state.copyWith(
          isUpdateQcChecklistLoading: false,
          isUpdateQcChecklistError: true,
          isUpdateQcChecklistSuccess: false,
        ),
      ),
      (data) async {
        // ✅ Fetch updated list
        final listResponse = await qcChecklistRepository.getQcCheckList();

        listResponse.fold(
          (error) => emit(
            state.copyWith(
              isUpdateQcChecklistLoading: false,
              isUpdateQcChecklistError: true,
            ),
          ),
          (list) => emit(
            state.copyWith(
              qcChecklist: List<GetQcChecklistModel>.from(list),
              commonResponseModel: data,
              isQcChecklistError: false,
              isQcChecklistSuccess: true,
              isQcChecklistLoading: false,
              isUpdateQcChecklistLoading: false,
              isUpdateQcChecklistError: false,
              isUpdateQcChecklistSuccess: true,
            ),
          ),
        );
      },
    );
  }

  void _deleteQcChecklist(
    DeleteQcChecklistEvent event,
    Emitter<QcChecklistState> emit,
  ) async {
    emit(
      state.copyWith(
        isDeleteQcChecklistLoading: true,
        isDeleteQcChecklistError: false,
        isDeleteQcChecklistSuccess: false,
      ),
    );

    final response = await qcChecklistRepository.deleteQcCheckList(event.qcId);

    response.fold(
      (error) {
        emit(
          state.copyWith(
            isDeleteQcChecklistLoading: false,
            isDeleteQcChecklistError: true,
          ),
        );
      },
      (data) {
        final updatedList = state.qcChecklist
            .where((e) => e.qcId != event.qcId)
            .toList();

        emit(
          state.copyWith(
            qcChecklist: updatedList, 
            commonResponseModel: data,
            isDeleteQcChecklistLoading: false,
            isDeleteQcChecklistSuccess: true,
          ),
        );
      },
    );
  }

  void _fetchQcChecklistById(
    FetchQcChecklistByIdEvent event,
    Emitter<QcChecklistState> emit,
  ) async {
    emit(
      state.copyWith(
        isFetchIdLoading: true,
        isFetchIdError: false,
        isFetchIdSuccess: false,
      ),
    );

    final response = await qcChecklistRepository.fetchQcCheckList(event.qcId);

    response.fold(
      (error) => emit(
        state.copyWith(
          isFetchIdLoading: false,
          isFetchIdError: true,
          isFetchIdSuccess: false,
        ),
      ),
      (list) {
        final data = list.first; // ✅ API returns LIST

        emit(
          state.copyWith(
            insertUpdateQcChecklistReqModel:
                InsertUpdateQcChecklistReqModel.fromGetModel(data),
            isFetchIdLoading: false,
            isFetchIdError: false,
            isFetchIdSuccess: true,
          ),
        );
      },
    );
  }

  void _clearFetchFlag(
    ClearFetchQcChecklistFlag event,
    Emitter<QcChecklistState> emit,
  ) {
    emit(state.copyWith(isFetchIdSuccess: false));
  }
}
