// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tech_dashboard_bloc.dart';

class TechDashboardState extends Equatable {
  /// 🔥 sentinel for nullable fields
  static const _unset = Object();
  final TechnicianDashboardResModel technicianDashboardResModel;
  final List<SpareListModel> spareListModel;
  final List<SparePartHistoryModel> sparePartHistoryModel;
  final UpdateTicketStatusReqModel updateTicketStatusReqModel;
  final RelocateTechnicianReqModel relocateTechnicianReqModel;
  final InsertSpareReqModel insertSpareReqModel;
  final List<InsertSpareResModel> insertSpareResModel;
  final CommonResponseModel commonResponseModel;
  final List<ProductDetailsResModel> productDetailsResModel;
  final SpareListModel? selectedSpare;
  final SpareListModel? pendingSpare;
  final ProductDetailsResModel? selectedProduct;
  final int elapsedSeconds;
  final bool isTimerRunning;
  final int qty;
  final double saleRate;
  final double discount;
  final double gross;
  final double net;
  final double gst;
  final double total;
  final bool showProductDetailsDialog;
  final bool istechnicianDashboardLoading;
  final bool istechnicianDashboardError;
  final bool istechnicianDashboardSuccess;
  final bool isspareListLoading;
  final bool isspareListError;
  final bool isspareListSuccess;
  final bool issparePartsHistoryLoading;
  final bool issparePartsHistoryError;
  final bool issparePartsHistorySuccess;
  final bool isupdateTechnicianLoading;
  final bool isupdateTechnicianError;
  final bool isupdateTechnicianSuccess;
  final bool isrelocateTechnicianLoading;
  final bool isrelocateTechnicianError;
  final bool isrelocateTechnicianSuccess;
  final bool isinsertSpareLoading;
  final bool isinsertSpareError;
  final bool isinsertSpareSuccess;
  final bool isProductDetailsLoading;
  final bool isProductDetailsError;
  final bool isProductDetailsSuccess;

  const TechDashboardState({
    required this.technicianDashboardResModel,
    required this.spareListModel,
    required this.sparePartHistoryModel,
    required this.updateTicketStatusReqModel,
    required this.relocateTechnicianReqModel,
    required this.insertSpareReqModel,
    required this.insertSpareResModel,
    required this.commonResponseModel,
    required this.productDetailsResModel,
    this.selectedSpare,
    this.pendingSpare,
    this.selectedProduct,
    this.elapsedSeconds = 0,
    this.isTimerRunning = false,
    this.qty = 0,
    this.saleRate = 0,
    this.discount = 0,
    this.gross = 0,
    this.net = 0,
    this.gst = 0,
    this.total = 0,
    this.showProductDetailsDialog = false,
    this.istechnicianDashboardLoading = false,
    this.istechnicianDashboardError = false,
    this.istechnicianDashboardSuccess = false,
    this.isspareListLoading = false,
    this.isspareListError = false,
    this.isspareListSuccess = false,
    this.issparePartsHistoryLoading = false,
    this.issparePartsHistoryError = false,
    this.issparePartsHistorySuccess = false,
    this.isupdateTechnicianLoading = false,
    this.isupdateTechnicianError = false,
    this.isupdateTechnicianSuccess = false,
    this.isrelocateTechnicianLoading = false,
    this.isrelocateTechnicianError = false,
    this.isrelocateTechnicianSuccess = false,
    this.isinsertSpareLoading = false,
    this.isinsertSpareError = false,
    this.isinsertSpareSuccess = false,
    this.isProductDetailsLoading = false,
    this.isProductDetailsError = false,
    this.isProductDetailsSuccess = false,
  });

  @override
  List<Object?> get props => [
    technicianDashboardResModel,
    spareListModel,
    sparePartHistoryModel,
    updateTicketStatusReqModel,
    relocateTechnicianReqModel,
    insertSpareReqModel,
    insertSpareResModel,
    commonResponseModel,
    productDetailsResModel,
    selectedSpare,
    pendingSpare,
    selectedProduct,
    elapsedSeconds,
    isTimerRunning,
    qty,
    saleRate,
    discount,
    gross,
    net,
    gst,
    total,
    showProductDetailsDialog,
    istechnicianDashboardLoading,
    istechnicianDashboardError,
    istechnicianDashboardSuccess,
    isspareListLoading,
    isspareListError,
    isspareListSuccess,
    issparePartsHistoryLoading,
    issparePartsHistoryError,
    issparePartsHistorySuccess,
    isupdateTechnicianLoading,
    isupdateTechnicianError,
    isupdateTechnicianSuccess,
    isrelocateTechnicianLoading,
    isrelocateTechnicianError,
    isrelocateTechnicianSuccess,
    isinsertSpareLoading,
    isinsertSpareError,
    isinsertSpareSuccess,
    isProductDetailsLoading,
    isProductDetailsError,
    isProductDetailsSuccess,
  ];

  TechDashboardState copyWith({
    TechnicianDashboardResModel? technicianDashboardResModel,
    List<SpareListModel>? spareListModel,
    List<SparePartHistoryModel>? sparePartHistoryModel,
    UpdateTicketStatusReqModel? updateTicketStatusReqModel,
    RelocateTechnicianReqModel? relocateTechnicianReqModel,
    InsertSpareReqModel? insertSpareReqModel,
    List<InsertSpareResModel>? insertSpareResModel,
    CommonResponseModel? commonResponseModel,
    List<ProductDetailsResModel>? productDetailsResModel,
    Object? selectedSpare = _unset,
    Object? pendingSpare = _unset,
    Object? selectedProduct = _unset,
    int? elapsedSeconds,
    bool? isTimerRunning,
    int? qty,
    double? saleRate,
    double? discount,
    double? gross,
    double? net,
    double? gst,
    double? total,
    bool? showProductDetailsDialog,
    bool? istechnicianDashboardLoading,
    bool? istechnicianDashboardError,
    bool? istechnicianDashboardSuccess,
    bool? isspareListLoading,
    bool? isspareListError,
    bool? isspareListSuccess,
    bool? issparePartsHistoryLoading,
    bool? issparePartsHistoryError,
    bool? issparePartsHistorySuccess,
    bool? isupdateTechnicianLoading,
    bool? isupdateTechnicianError,
    bool? isupdateTechnicianSuccess,
    bool? isrelocateTechnicianLoading,
    bool? isrelocateTechnicianError,
    bool? isrelocateTechnicianSuccess,
    bool? isinsertSpareLoading,
    bool? isinsertSpareError,
    bool? isinsertSpareSuccess,
    bool? isProductDetailsLoading,
    bool? isProductDetailsError,
    bool? isProductDetailsSuccess,
  }) {
    return TechDashboardState(
      technicianDashboardResModel:
          technicianDashboardResModel ?? this.technicianDashboardResModel,
      spareListModel: spareListModel ?? this.spareListModel,
      sparePartHistoryModel:
          sparePartHistoryModel ?? this.sparePartHistoryModel,
      updateTicketStatusReqModel:
          updateTicketStatusReqModel ?? this.updateTicketStatusReqModel,
      relocateTechnicianReqModel:
          relocateTechnicianReqModel ?? this.relocateTechnicianReqModel,
      insertSpareReqModel: insertSpareReqModel ?? this.insertSpareReqModel,
      insertSpareResModel: insertSpareResModel ?? this.insertSpareResModel,
      commonResponseModel: commonResponseModel ?? this.commonResponseModel,
      productDetailsResModel:
          productDetailsResModel ?? this.productDetailsResModel,
      selectedSpare: selectedSpare == _unset
          ? this.selectedSpare
          : selectedSpare as SpareListModel?,
      pendingSpare: pendingSpare == _unset
          ? this.pendingSpare
          : pendingSpare as SpareListModel?,
      selectedProduct: selectedProduct == _unset
          ? this.selectedProduct
          : selectedProduct as ProductDetailsResModel?,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      isTimerRunning: isTimerRunning ?? this.isTimerRunning,
      qty: qty ?? this.qty,
      saleRate: saleRate ?? this.saleRate,
      discount: discount ?? this.discount,
      gross: gross ?? this.gross,
      net: net ?? this.net,
      gst: gst ?? this.gst,
      total: total ?? this.total,
      showProductDetailsDialog:
          showProductDetailsDialog ?? this.showProductDetailsDialog,
      istechnicianDashboardLoading:
          istechnicianDashboardLoading ?? this.istechnicianDashboardLoading,
      istechnicianDashboardError:
          istechnicianDashboardError ?? this.istechnicianDashboardError,
      istechnicianDashboardSuccess:
          istechnicianDashboardSuccess ?? this.istechnicianDashboardSuccess,
      isspareListLoading: isspareListLoading ?? this.isspareListLoading,
      isspareListError: isspareListError ?? this.isspareListError,
      isspareListSuccess: isspareListSuccess ?? this.isspareListSuccess,
      issparePartsHistoryLoading:
          issparePartsHistoryLoading ?? this.issparePartsHistoryLoading,
      issparePartsHistoryError:
          issparePartsHistoryError ?? this.issparePartsHistoryError,
      issparePartsHistorySuccess:
          issparePartsHistorySuccess ?? this.issparePartsHistorySuccess,
      isupdateTechnicianLoading:
          isupdateTechnicianLoading ?? this.isupdateTechnicianLoading,
      isupdateTechnicianError:
          isupdateTechnicianError ?? this.isupdateTechnicianError,
      isupdateTechnicianSuccess:
          isupdateTechnicianSuccess ?? this.isupdateTechnicianSuccess,
      isrelocateTechnicianLoading:
          isrelocateTechnicianLoading ?? this.isrelocateTechnicianLoading,
      isrelocateTechnicianError:
          isrelocateTechnicianError ?? this.isrelocateTechnicianError,
      isrelocateTechnicianSuccess:
          isrelocateTechnicianSuccess ?? this.isrelocateTechnicianSuccess,
      isinsertSpareLoading: isinsertSpareLoading ?? this.isinsertSpareLoading,
      isinsertSpareError: isinsertSpareError ?? this.isinsertSpareError,
      isinsertSpareSuccess: isinsertSpareSuccess ?? this.isinsertSpareSuccess,
      isProductDetailsLoading:
          isProductDetailsLoading ?? this.isProductDetailsLoading,
      isProductDetailsError:
          isProductDetailsError ?? this.isProductDetailsError,
      isProductDetailsSuccess:
          isProductDetailsSuccess ?? this.isProductDetailsSuccess,
    );
  }
}
