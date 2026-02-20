import '../../common/model/generic_types.dart';
import '../model/get_spare_detailed_res_model.dart';
import '../model/get_spare_request_list_res_model.dart';

abstract class SpareAllocationRepository{
  FutureEither<List<GetSpareRequestListResponseModel>> getSpareRequestList();
  FutureEither<GetSpareDetailedResponseModel> getSpareDetailed(int siEntryNo);
}