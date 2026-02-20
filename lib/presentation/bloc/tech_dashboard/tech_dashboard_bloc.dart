import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/domain/common/enums/enum.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/product_details_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/relocate_technician_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_list_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_parts_history.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/technician_dashboard_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/update_technician_status_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/repository/tech_dashboard_repository.dart';
import 'package:gulfownsalesview/util/response_type_mapper.dart';

part 'tech_dashboard_event.dart';
part 'tech_dashboard_state.dart';

class TechDashboardBloc extends Bloc<TechDashboardEvent, TechDashboardState> {
  final TechDashboardRepository technicianDashboardRepository;
  Timer? _timer;
  TechDashboardBloc(this.technicianDashboardRepository)
    : super(
        TechDashboardState(
          technicianDashboardResModel: TechnicianDashboardResModel.dummy(),
          spareListModel: [],
          sparePartHistoryModel: [],
          updateTicketStatusReqModel: UpdateTicketStatusReqModel.dummy(),
          relocateTechnicianReqModel: RelocateTechnicianReqModel.dummy(),
          insertSpareReqModel: InsertSpareReqModel.dummy(),
          insertSpareResModel: [],
          commonResponseModel: CommonResponseModel.dummy(),
          productDetailsResModel: [],
        ),
      ) {
    on<TechnicianDashboardEvent>(_getAllTechnicianDashboard);
    on<SpareListEvent>(_getAllSpareList);
    on<SparePartHistoryEvent>(_getAllSparePartHistory);
    on<UpdateTechnicianEvent>(_updateTechnician);
    on<RelocateTechnicianEvent>(_relocateTechnician);
    on<InsertSpareEvent>(_insertSpare);
    on<ProductDetailsEvent>(_getAllProductDetails);
    on<SelectSpareEvent>(_selectSpare);
    on<SelectProductBatchEvent>(_selectProductBatch);
    on<UpdateQtyEvent>(_updateQty);
    on<UpdateRateEvent>(_updateRate);
    on<UpdateDiscountEvent>(_updateDiscount);
    on<ResetSpareEntryEvent>(_resetSpareEntry);
    on<StartTimerEvent>(_startTimer);
    on<StopTimerEvent>(_stopTimer);
    on<TickTimerEvent>(_tickTimer);
  }

  SpareList _mapInsertedSpareToDashboard(
    InsertSpareResModel res,
    SpareListModel selectedSpare,
    int ticketNo,
  ) {
    return SpareList(
      id: res.srId,
      ticketNo: ticketNo,
      itemId: res.srItemId,
      name: selectedSpare.irName,
      quantity: res.srQty,
      rate: res.srSRate,
      discount: res.srDiscount,
      gross: res.srGross,
      net: res.srNet,
      gst: res.srGst,
      total: res.srTotal,
      status: res.srStatus,
      createdBy: res.createdBy,
      createdDate: res.createdDate,
    );
  }

  void _getAllTechnicianDashboard(
  TechnicianDashboardEvent event,
  Emitter<TechDashboardState> emit,
) async {
  final ticketId = event.id;

  emit(state.copyWith(istechnicianDashboardLoading: true));

  final response =
      await technicianDashboardRepository.getTechnicianDashboard(ticketId);

  response.fold(
    (error) => emit(
      state.copyWith(
        istechnicianDashboardLoading: false,
        istechnicianDashboardError: true,
      ),
    ),
    (data) {
      final elapsedSeconds =
          _parseWorkedTimeToSeconds(data.ticket?.workedMinutes);

      emit(
        state.copyWith(
          istechnicianDashboardLoading: false,
          istechnicianDashboardError: false,
          istechnicianDashboardSuccess: true,
          technicianDashboardResModel: data,
          elapsedSeconds: elapsedSeconds,
        ),
      );

      // 🔥 AUTO RESUME TIMER IF IN PROGRESS
      final status =
          responseTypeFromApi(data.ticket?.otherRemarks);

      if (status == ResponseType.inProgress) {
        add(const StartTimerEvent());
      }
    },
  );
}

  void _getAllSpareList(
    SpareListEvent event,
    Emitter<TechDashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        isspareListLoading: true,
        isspareListError: false,
        isspareListSuccess: false,
      ),
    );
    final response = await technicianDashboardRepository.getSpareList();

    response.fold(
      (error) => emit(
        state.copyWith(
          isspareListLoading: false,
          isspareListError: true,
          isspareListSuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          isspareListLoading: false,
          isspareListError: false,
          isspareListSuccess: true,
          spareListModel: data,
        ),
      ),
    );
  }

  void _getAllSparePartHistory(
    SparePartHistoryEvent event,
    Emitter<TechDashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        issparePartsHistoryLoading: true,
        issparePartsHistoryError: false,
        issparePartsHistorySuccess: false,
      ),
    );
    final response = await technicianDashboardRepository.getSparePartsHistory(
      event.id,
    );
    response.fold(
      (error) => emit(
        state.copyWith(
          issparePartsHistoryLoading: false,
          issparePartsHistoryError: true,
          issparePartsHistorySuccess: false,
        ),
      ),
      (data) => emit(
        state.copyWith(
          issparePartsHistoryLoading: false,
          issparePartsHistoryError: false,
          issparePartsHistorySuccess: true,
          sparePartHistoryModel: data,
        ),
      ),
    );
  }

  Future<void> _updateTechnician(
    UpdateTechnicianEvent event,
    Emitter<TechDashboardState> emit,
  ) async {
    final ticket = state.technicianDashboardResModel.ticket;
    if (ticket == null) return;

    final req = UpdateTicketStatusReqModel(
      ticketId: ticket.entryNo,
      technicianId: ticket.assignTo,
      status: event.status.apiValue,
      remarks: event.remarks,
    );

    emit(state.copyWith(isupdateTechnicianLoading: true));

    final response = await technicianDashboardRepository.updateTechnicianStatus(
      req,
    );

    response.fold(
      (l) {
        emit(
          state.copyWith(
            isupdateTechnicianLoading: false,
            isupdateTechnicianError: true,
            isupdateTechnicianSuccess: false,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            isupdateTechnicianLoading: false,
            isupdateTechnicianSuccess: true,
            isupdateTechnicianError: false,
            commonResponseModel: r,
          ),
        );

        // 🔥 TIMER CONTROL — ONLY AFTER SUCCESS
        if (event.status == ResponseType.inProgress) {
          add(StartTimerEvent());
        } else {
          add(StopTimerEvent());
        }
      },
    );
  }

  Future<void> _relocateTechnician(
    RelocateTechnicianEvent event,
    Emitter<TechDashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        isrelocateTechnicianLoading: true,
        isrelocateTechnicianError: false,
        isrelocateTechnicianSuccess: false,
      ),
    );

    try {
      final response = await technicianDashboardRepository.relocateTechnician(
        event.relocateTechnicianReqModel,
      );

      response.fold(
        (error) {
          log("❌ Relocate error: ${error.message}");
          emit(
            state.copyWith(
              isrelocateTechnicianLoading: false,
              isrelocateTechnicianError: true,
              isrelocateTechnicianSuccess: false,
            ),
          );
        },
        (data) {
          log("✅ Relocate success: ${data.message}");
          emit(
            state.copyWith(
              isrelocateTechnicianLoading: false,
              isrelocateTechnicianSuccess: true,
              isrelocateTechnicianError: false,
              commonResponseModel: data,
            ),
          );
        },
      );
    } catch (e, s) {
      log("🔥 Exception in relocate", error: e, stackTrace: s);
      emit(
        state.copyWith(
          isrelocateTechnicianLoading: false,
          isrelocateTechnicianError: true,
        ),
      );
    }
  }

  Future<void> _insertSpare(
    InsertSpareEvent event,
    Emitter<TechDashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        isinsertSpareLoading: true,
        isinsertSpareError: false,
        isinsertSpareSuccess: false,
      ),
    );

    final response = await technicianDashboardRepository.insertSpare(
      event.insertSpareReqModel,
    );

    response.fold(
      (error) {
        emit(
          state.copyWith(
            isinsertSpareLoading: false,
            isinsertSpareError: true,
            isinsertSpareSuccess: false,
          ),
        );
      },

      // ✅ SUCCESS
      (data) {
        // 🔥 API RETURNS LIST
        if (data.isEmpty) {
          emit(
            state.copyWith(
              isinsertSpareLoading: false,
              isinsertSpareError: true,
              isinsertSpareSuccess: false,
            ),
          );
          return;
        }

        final selectedSpare = state.selectedSpare;
        final ticket = state.technicianDashboardResModel.ticket;

        if (selectedSpare == null || ticket == null) {
          emit(
            state.copyWith(
              isinsertSpareLoading: false,
              isinsertSpareError: true,
              isinsertSpareSuccess: false,
            ),
          );
          return;
        }

        // ✅ USE FIRST ITEM FROM API RESPONSE
        final InsertSpareResModel res = data.first;

        // 🔥 Convert API → UI model
        final SpareList newSpare = _mapInsertedSpareToDashboard(
          res,
          selectedSpare,
          ticket.entryNo,
        );

        // 🔥 Append to dashboard spare list (SINGLE SOURCE OF TRUTH)
        final List<SpareList> updatedDashboardSpareList = [
          ...state.technicianDashboardResModel.spareList,
          newSpare,
        ];

        emit(
          state.copyWith(
            // status
            isinsertSpareLoading: false,
            isinsertSpareError: false,
            isinsertSpareSuccess: true,

            // 🔥 THIS IS WHAT UI LISTENS TO
            technicianDashboardResModel: state.technicianDashboardResModel
                .copyWith(spareList: updatedDashboardSpareList),

            // 🔥 reset entry state
            selectedSpare: null,
            pendingSpare: null,
            selectedProduct: null,
            qty: 0,
            saleRate: 0,
            discount: 0,
            gross: 0,
            net: 0,
            gst: 0,
            total: 0,
            showProductDetailsDialog: false,
          ),
        );
      },
    );
  }

  Future<void> _getAllProductDetails(
    ProductDetailsEvent event,
    Emitter<TechDashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        isProductDetailsLoading: true,
        showProductDetailsDialog: false,
      ),
    );

    final response = await technicianDashboardRepository.productDetails(
      event.id,
    );

    response.fold(
      (error) => emit(
        state.copyWith(
          isProductDetailsLoading: false,
          isProductDetailsError: true,
        ),
      ),
      (data) {
        if (data.isEmpty) {
          // ✅ No batch → directly select spare
          emit(
            state.copyWith(
              isProductDetailsLoading: false,
              selectedSpare: state.pendingSpare,
              productDetailsResModel: [],
              pendingSpare: null,
            ),
          );
        } else {
          // ✅ Has batches → open product dialog
          emit(
            state.copyWith(
              isProductDetailsLoading: false,
              productDetailsResModel: data,
              showProductDetailsDialog: true,
            ),
          );
        }
      },
    );
  }

  void _selectSpare(SelectSpareEvent event, Emitter<TechDashboardState> emit) {
    emit(
      state.copyWith(
        pendingSpare: event.spare,
        selectedProduct: null,
        qty: 0,
        saleRate: 0,
        discount: 0,
        gross: 0,
        net: 0,
        gst: 0,
        total: 0,
      ),
    );
  }

  void _selectProductBatch(
    SelectProductBatchEvent event,
    Emitter<TechDashboardState> emit,
  ) {
    final rate = double.tryParse(event.product.retail) ?? 0;

    final int apiQty = int.tryParse(event.product.qty.split('.').first) ?? 1;

    emit(
      state.copyWith(
        selectedProduct: event.product,
        selectedSpare: state.pendingSpare,
        pendingSpare: null,
        qty: apiQty, // ✅ USE API QTY
        saleRate: rate,
        showProductDetailsDialog: false,
      ),
    );

    _recalculate(emit, qty: apiQty, saleRate: rate);
  }

  void _updateQty(UpdateQtyEvent event, Emitter<TechDashboardState> emit) {
    _recalculate(emit, qty: event.qty);
  }

  void _updateRate(UpdateRateEvent event, Emitter<TechDashboardState> emit) {
    _recalculate(emit, saleRate: event.rate);
  }

  void _updateDiscount(
    UpdateDiscountEvent event,
    Emitter<TechDashboardState> emit,
  ) {
    _recalculate(emit, discount: event.discount);
  }

  void _recalculate(
    Emitter<TechDashboardState> emit, {
    int? qty,
    double? saleRate,
    double? discount,
  }) {
    final int q = qty ?? state.qty;
    final int safeQty = q <= 0 ? 1 : q;

    final double rateInclGst = saleRate ?? state.saleRate;
    final double discPerItem = discount ?? state.discount;

    final double gstPercent =
        (state.selectedProduct?.irCgst ?? 0) +
        (state.selectedProduct?.irSgst ?? 0);

    if (rateInclGst <= 0) {
      emit(
        state.copyWith(
          qty: safeQty,
          saleRate: rateInclGst,
          discount: discPerItem,
          gross: 0,
          net: 0,
          gst: 0,
          total: 0,
        ),
      );
      return;
    }

    // Convert GST-inclusive rate to actual base rate
    final double actualRate = gstPercent > 0
        ? rateInclGst / (1 + gstPercent / 100)
        : rateInclGst;

    final double gross = actualRate * safeQty;
    final double totalDiscount = discPerItem * safeQty;
    final double net = (gross - totalDiscount).clamp(0, double.infinity);
    final double gstAmount = actualRate * gstPercent / 100;
    final double total = net + gstAmount;

    double round(double v) => double.parse(v.toStringAsFixed(2));

    emit(
      state.copyWith(
        qty: safeQty,
        saleRate: round(rateInclGst),
        discount: round(discPerItem),
        gross: round(gross),
        net: round(net),
        gst: round(gstAmount),
        total: round(total),
      ),
    );
  }

  void _resetSpareEntry(
    ResetSpareEntryEvent event,
    Emitter<TechDashboardState> emit,
  ) {
    emit(
      state.copyWith(
        selectedSpare: null,
        pendingSpare: null,
        selectedProduct: null,
        qty: 0,
        saleRate: 0,
        discount: 0,
        gross: 0,
        net: 0,
        gst: 0,
        total: 0,
        showProductDetailsDialog: false,
      ),
    );
  }

  void _startTimer(StartTimerEvent event, Emitter<TechDashboardState> emit) {
    if (_timer != null) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(TickTimerEvent());
    });

    emit(state.copyWith(isTimerRunning: true));
  }

  void _stopTimer(StopTimerEvent event, Emitter<TechDashboardState> emit) {
    _timer?.cancel();
    _timer = null;

    emit(state.copyWith(isTimerRunning: false));
  }

  void _tickTimer(TickTimerEvent event, Emitter<TechDashboardState> emit) {
    emit(state.copyWith(elapsedSeconds: state.elapsedSeconds + 1));
  }

  int _parseWorkedTimeToSeconds(String? value) {
    if (value == null || value.isEmpty) return 0;

    final parts = value.split(':');
    if (parts.length != 3) return 0;

    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;
    final seconds = int.tryParse(parts[2]) ?? 0;

    return (hours * 3600) + (minutes * 60) + seconds;
  }
}
