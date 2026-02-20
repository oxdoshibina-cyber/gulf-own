import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/common/model/common_response_model.dart';
import '../../../domain/items_collected/model/insert_items_collected_req_model.dart';
import '../../../domain/items_collected/model/items_collected_response_model.dart';
import '../../../domain/items_collected/repository/items_collected_repository.dart';

part 'items_collected_event.dart';
part 'items_collected_state.dart';

class ItemsCollectedBloc
    extends Bloc<ItemsCollectedEvent, ItemsCollectedState> {
  final ItemsCollectedRepository itemsCollectedRepository;

  ItemsCollectedBloc(this.itemsCollectedRepository)
    : super(
        ItemsCollectedState(
          itemsCollectedList: const [],
          commonResponseModel: CommonResponseModel.dummy(),
          insertItemsCollectedReqModel: InsertItemsCollectedReqModel.dummy(),
          updateItemsCollectedReqModel: InsertItemsCollectedReqModel.dummy(),
          collectedItem: ItemsCollectedResponseModel.dummy(),
        ),
      ) {
    on<GetItemsCollectedEvent>(_getItemsCollected);
    on<InsertItemsCollectedEvent>(_insertItemsCollected);
    on<UpdateItemsCollectedEvent>(_updateItemsCollected);
    on<GetItemsCollectedByIdEvent>(_getItemsCollectedById);
    on<ClearItemsCollectedFlag>(_clearFetchFlag);
    on<DeleteItemsCollectedEvent>(_deleteItemsCollected);
  }

  Future<void> _getItemsCollected(
    GetItemsCollectedEvent event,
    Emitter<ItemsCollectedState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false, isSuccess: false));

    final response = await itemsCollectedRepository.getItemsCollectedList();

    response.fold(
      (error) => emit(
        state.copyWith(isLoading: false, isError: true, isSuccess: false),
      ),
      (data) => emit(
        state.copyWith(
          itemsCollectedList: data,
          isLoading: false,
          isError: false,
          isSuccess: true,
        ),
      ),
    );
  }

  Future<void> _getItemsCollectedById(
    GetItemsCollectedByIdEvent event,
    Emitter<ItemsCollectedState> emit,
  ) async {
    emit(
        state.copyWith(
          isFetchIdLoading: true,
          isFetchIdError: false,
          isFetchIdSuccess: false,
        ));
    final response = await itemsCollectedRepository.getItemsCollectedById(
      event.id,
    );
    response.fold(
      (error) => emit(
        state.copyWith(
          isFetchIdLoading: false,
          isFetchIdError: true,
          isFetchIdSuccess: false,
        ),
      ),
        (list){
          final data = list.first; // ✅ API returns LIST
          emit(
            state.copyWith(
              isFetchIdLoading: false,
              isFetchIdError: false,
              isFetchIdSuccess: true,
              updateItemsCollectedReqModel:
              InsertItemsCollectedReqModel.fromGetModel(data),
            )
          );
        }

      // (data) => emit(
      //   state.copyWith(
      //     isLoading: false,
      //     isError: false,
      //     isSuccess: true,
      //     itemsCollectedList: [data],
      //   ),
      // ),
    );
  }

  Future<void> _insertItemsCollected(
    InsertItemsCollectedEvent event,
    Emitter<ItemsCollectedState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false, isSuccess: false));

    final response = await itemsCollectedRepository.insertItemsCollected(
      event.insertItemsCollectedReqModel,
    );

    log("items collected response : $response");

    response.fold(
      (error) => emit(
        state.copyWith(
            isLoading: false,
            isError: true,
            isSuccess: false,
            commonResponseModel: CommonResponseModel(status: error.statusCode.toString(), message: error.message.toString()),
        )

      ),
      (data) => emit(
        state.copyWith(
          isLoading: false,
          isError: false,
          isSuccess: true,
          commonResponseModel: data,
        ),
      ),
    );
    add(const GetItemsCollectedEvent());
  }

  Future<void> _updateItemsCollected(
    UpdateItemsCollectedEvent event,
    Emitter<ItemsCollectedState> emit,
  ) async {
    emit(
      state.copyWith(
        isUpdateLoading: true,
        isUpdateError: false,
        isUpdateSuccess: false,
      ),
    );

    final response = await itemsCollectedRepository.updateItemsCollected(
      event.updateItemsCollectedReqModel,
    );

    log("update items collected response : $response");

    await response.fold(
      (error) async{
        emit(
        state.copyWith(
          isUpdateLoading: false,
          isUpdateError: true,
          isUpdateSuccess: false,
        ),
      );
        },
      //   (data) => emit(
      // state.copyWith(
      //   isUpdateLoading: false,
      //   isUpdateError: false,
      //   isUpdateSuccess: true,
      //   insertItemsCollectedResModel: data,
      // ),
      //   )
      (data) async {
        final listResponse = await itemsCollectedRepository
            .getItemsCollectedList();
        await listResponse.fold(
          (error) async{ emit(
            state.copyWith(
              isUpdateLoading: false,
              isUpdateError: true,
              isUpdateSuccess: false,
            ),
          );},
          (list) async{ emit(
            state.copyWith(
              itemsCollectedList: List<ItemsCollectedResponseModel>.from(list),
              commonResponseModel: data,
              isUpdateLoading: false,
              isUpdateError: false,
              isUpdateSuccess: true,
              isLoading: false,
              isError: false,
              isSuccess: true,
            ),
          );},
        );
      },
    );
  }

  void _clearFetchFlag(
      ClearItemsCollectedFlag event,
      Emitter<ItemsCollectedState> emit,
      ) {
    emit(state.copyWith(isFetchIdSuccess: false));
  }

  Future<void> _deleteItemsCollected(
      DeleteItemsCollectedEvent event,
      Emitter<ItemsCollectedState> emit,
      ) async {
    emit(state.copyWith(
      isDeleteIcLoading: true,
      isDeleteIcError: false,
      isDeleteIcSuccess: false,
    ));

    final response = await itemsCollectedRepository
        .deleteItemsCollected(event.id);

    await response.fold(
          (error) async {
        emit(state.copyWith(
          isDeleteIcLoading: false,
          isDeleteIcError: true,
          isDeleteIcSuccess: false,
        ));
      },
          (data) async {
        // 🔥 REFRESH LIST AFTER DELETE SUCCESS
        final listResponse =
        await itemsCollectedRepository.getItemsCollectedList();



        listResponse.fold(
              (error) {
            emit(state.copyWith(
              isDeleteIcLoading: false,
              isDeleteIcError: true,
              isDeleteIcSuccess: false,
            ));
          },
              (list) {
            emit(state.copyWith(
              itemsCollectedList: List<ItemsCollectedResponseModel>.from(list),
              commonResponseModel: data,
              isDeleteIcLoading: false,
              isDeleteIcError: false,
              isDeleteIcSuccess: true,
            ));
          },
        );
      },
    );
    add(const GetItemsCollectedEvent());
  }


// Future<void> _deleteItemsCollected(
  //   DeleteItemsCollectedEvent event,
  //   Emitter<ItemsCollectedState> emit,
  // ) async {
  //
  //   log("fffffffffffffffff1");
  //   emit(
  //     state.copyWith(
  //       isDeleteIcLoading: true,
  //       isDeleteIcError: false,
  //       isDeleteIcSuccess: false,
  //     ),
  //   );
  //
  //   final response = await itemsCollectedRepository.deleteItemsCollected(event.id);
  //
  //   log("fffffffffffffffff2");
  //   response.fold(
  //     (error) => emit(
  //       state.copyWith(
  //         isDeleteIcLoading: false,
  //         isDeleteIcError: true,
  //         isDeleteIcSuccess: false,
  //       ),
  //   ),
  //       (data){
  //         log("fffffffffffffffff3");
  //       final updatedList = List<ItemsCollectedResponseModel>.from(state.itemsCollectedList)
  //           ..removeWhere((e) => e.iicId == event.id);
  //
  //       log("updatedList : $updatedList");
  //
  //       emit(
  //         state.copyWith(
  //           itemsCollectedList: [...updatedList], // 🔥 UI UPDATES INSTANTLY
  //           commonResponseModel: data,
  //           isDeleteIcLoading: false,
  //           isDeleteIcSuccess: true,
  //         ),
  //       );
  //       },
  //   );
  // }
}
