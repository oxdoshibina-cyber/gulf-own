import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_complaint.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/insert_service_complaint_req_model.dart';

abstract class RegisterComplaintRepository {
  FutureEither<List<GetServiceComplaint>> getServiceComplaintList();
  FutureEither<List<GetServiceComplaint>> getAllCustomers();
  FutureEither<CommonResponseModel> insertServiceComplaint(
    InsertServiceComplaintReqModel insertServiceComplaintReqModel,
  );
  FutureEither<List<GetServiceComplaint>> getServiceComplaintMobile(
    String mobile,
  );
  FutureEither<List<GetServiceCategory>> getServiceCategory();
}
