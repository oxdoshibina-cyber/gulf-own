import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_res_model.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/product_details_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/relocate_technician_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_list_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_parts_history.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/technician_dashboard_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/update_technician_status_req_model.dart';

abstract class TechDashboardRepository {
  FutureEither<TechnicianDashboardResModel> getTechnicianDashboard(int id);
  FutureEither<List<SpareListModel>> getSpareList();
  FutureEither<List<SparePartHistoryModel>> getSparePartsHistory(int id);
  FutureEither<CommonResponseModel> updateTechnicianStatus(
    UpdateTicketStatusReqModel updateTicketStatusReqModel,
  );
  FutureEither<CommonResponseModel> relocateTechnician(
    RelocateTechnicianReqModel relocateTechnicianReqModel,
  );
  FutureEither<List<InsertSpareResModel>> insertSpare(
    InsertSpareReqModel insertSpareReqModel,
  );
  FutureEither<List<ProductDetailsResModel>> productDetails(int id);
}
