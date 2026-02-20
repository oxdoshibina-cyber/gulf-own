import 'package:gulfownsalesview/domain/assign_tickets/model/assign_technician_req_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_req_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_res_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_res_model.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';

abstract class AssignTicketsRepository {
  FutureEither<List<GetTicketsResModel>> getTicketList(String status);
  FutureEither<GetTicketsByIdResModel> getTicketById(
    GetTicketsByIdReqModel model,
  );
  FutureEither<CommonResponseModel> assignTechnician(
    AssignTechnicianReqModel model,
  );
}
