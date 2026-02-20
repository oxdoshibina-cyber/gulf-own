import 'package:gulfownsalesview/domain/add_tickets/model/get_description_list_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_brand_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_card_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_cash_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_req_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_res_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_req_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_res_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';

abstract class AddTicketsRepository {
  FutureEither<List<GetServiceBrandModel>> getServiceBrand();
  FutureEither<InsertTicketResModel> insertTicket(
    InsertTicketReqModel insertReqModel,
  );
  FutureEither<List<GetServiceCashModel>> getServiceCash();
  FutureEither<List<GetServiceCardModel>> getServiceCard();
  FutureEither<List<GetDescriptionListModel>> getDescriptionList();
  FutureEither<List<InsertDescriptionResModel>> insertDescription(
    InsertDescriptionReqModel insertDescriptionReqModel,
  );
}
