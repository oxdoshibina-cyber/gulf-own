import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/completed_works/model/service_return_res_model.dart';

import '../model/completed_work_details_res_model.dart';
import '../model/completed_work_res_model.dart';

abstract class CompletedWorkRepository{
  FutureEither<List<CompletedWorkResponseModel>> getCompletedWorkList(
      String fromDate, String toDate, String searchQuery);
  FutureEither<CompletedWorkDetailsResponseModel> getCompletedWorkDetails(int workId);
  FutureEither<ServiceReturnResponseModel> insertServiceReturn(int siEntryNo, int asId, String remarks);

}