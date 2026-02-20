import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_description_list_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_brand_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_card_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_cash_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_req_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_res_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_req_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_res_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/repository/add_tickets_repository.dart';

part 'add_tickets_event.dart';
part 'add_tickets_state.dart';

class AddTicketsBloc extends Bloc<AddTicketsEvent, AddTicketsState> {
  final AddTicketsRepository addTicketsRepository;
  AddTicketsBloc(this.addTicketsRepository)
    : super(
        AddTicketsState(
          serviceBrands: const [],
          insertTicketResModel: InsertTicketResModel.dummy(),
          insertTicketReqModel: InsertTicketReqModel.dummy(),
          getServiceCash: const [],
          getServiceCard: const [],
          descriptionList: const [],
          insertDescriptionReqModel: InsertDescriptionReqModel.dummy(),
          insertDescriptionResModel: const [],
        ),
      ) {
    on<GetServiceBrandEvent>(_getServiceBrand);
    on<InsertTicketEvent>(_insertTicket);
    on<GetServiceCashEvent>(_getServiceCash);
    on<GetServiceCardEvent>(_getServiceCard);
    on<GetDescriptionListEvent>(_getDescriptionList);
    on<InsertDescriptionEvent>(_insertDescription);
    on<ResetInsertTicketEvent>(_resetInsertTicket);
  }

  void _getServiceBrand(
    GetServiceBrandEvent event,
    Emitter<AddTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        isServiceBrandLoading: true,
        isServiceBrandError: false,
        isServiceBrandSuccess: false,
      ),
    );

    final response = await addTicketsRepository.getServiceBrand();
    response.fold(
      (error) => emit(
        state.copyWith(
          isServiceBrandLoading: false,
          isServiceBrandError: true,
          isServiceBrandSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          isServiceBrandLoading: false,
          isServiceBrandError: false,
          isServiceBrandSuccess: true,
          serviceBrands: data,
        ),
      ),
    );
  }

  void _insertTicket(
    InsertTicketEvent event,
    Emitter<AddTicketsState> emit,
  ) async {
    log('🔵 Inserting ticket...'); // Add this

    emit(
      state.copyWith(
        isInsertTicketLoading: true,
        isInsertTicketError: false,
        isInsertTicketSuccess: false,
      ),
    );

    final response = await addTicketsRepository.insertTicket(
      event.insertTicketReqModel,
    );

    response.fold(
      (error) {
        log('🔴 Insert ticket error: $error'); // Add this
        emit(
          state.copyWith(
            isInsertTicketLoading: false,
            isInsertTicketError: true,
            isInsertTicketSuccess: false,
          ),
        );
      },
      (data) {
        log('🟢 Insert ticket success: $data'); // Add this
        emit(
          state.copyWith(
            isInsertTicketLoading: false,
            isInsertTicketError: false,
            isInsertTicketSuccess: true,
            insertTicketResModel: data,
          ),
        );
      },
    );
  }

  void _getServiceCash(
    GetServiceCashEvent event,
    Emitter<AddTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        isGetServiceCashLoading: true,
        isGetServiceCashError: false,
        isGetServiceCashSuccess: false,
      ),
    );

    final response = await addTicketsRepository.getServiceCash();

    response.fold(
      (error) {
        emit(
          state.copyWith(
            isGetServiceCashLoading: false,
            isGetServiceCashError: true,
            isGetServiceCashSuccess: false,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isGetServiceCashLoading: false,
            isGetServiceCashError: false,
            isGetServiceCashSuccess: true,
            getServiceCash: data,
          ),
        );
      },
    );
  }

  void _getServiceCard(
    GetServiceCardEvent event,
    Emitter<AddTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        isGetServiceCardLoading: true,
        isGetServiceCardError: false,
        isGetServiceCardSuccess: false,
      ),
    );

    final response = await addTicketsRepository.getServiceCard();

    response.fold(
      (error) {
        emit(
          state.copyWith(
            isGetServiceCardLoading: false,
            isGetServiceCardError: true,
            isGetServiceCardSuccess: false,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isGetServiceCardLoading: false,
            isGetServiceCardError: false,
            isGetServiceCardSuccess: true,
            getServiceCard: data,
          ),
        );
      },
    );
  }

  void _getDescriptionList(
    GetDescriptionListEvent event,
    Emitter<AddTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        isGetDescriptionListLoading: true,
        isGetDescriptionListError: false,
        isGetDescriptionListSuccess: false,
      ),
    );

    final response = await addTicketsRepository.getDescriptionList();

    response.fold(
      (error) {
        emit(
          state.copyWith(
            isGetDescriptionListLoading: false,
            isGetDescriptionListError: true,
            isGetDescriptionListSuccess: false,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isGetDescriptionListLoading: false,
            isGetDescriptionListError: false,
            isGetDescriptionListSuccess: true,
            descriptionList: data,
          ),
        );
      },
    );
  }

  void _insertDescription(
    InsertDescriptionEvent event,
    Emitter<AddTicketsState> emit,
  ) async {
    emit(
      state.copyWith(
        isInsertDescriptionLoading: true,
        isInsertDescriptionError: false,
        isInsertDescriptionSuccess: false,
      ),
    );

    final response = await addTicketsRepository.insertDescription(
      event.insertDescriptionReqModel,
    );

    response.fold(
      (error) {
        emit(
          state.copyWith(
            isInsertDescriptionLoading: false,
            isInsertDescriptionError: true,
            isInsertDescriptionSuccess: false,
          ),
        );
      },
      (data) {
        // ✅ Convert API response → dropdown model
        final newDescriptions = data
            .map((e) => GetDescriptionListModel(irId: e.irId, irName: e.irName))
            .toList();

        // ✅ Merge with existing list (avoid duplicates)
        final updatedList = [
          ...state.descriptionList,
          ...newDescriptions.where(
            (newItem) =>
                !state.descriptionList.any((old) => old.irId == newItem.irId),
          ),
        ];

        emit(
          state.copyWith(
            isInsertDescriptionLoading: false,
            isInsertDescriptionError: false,
            isInsertDescriptionSuccess: true,
            descriptionList: updatedList,
          ),
        );
      },
    );
  }

  void _resetInsertTicket(
    ResetInsertTicketEvent event,
    Emitter<AddTicketsState> emit,
  ) {
    emit(
      state.copyWith(
        isInsertTicketLoading: false,
        isInsertTicketSuccess: false,
        isInsertTicketError: false,
      ),
    );
  }
}
