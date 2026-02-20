import 'package:gulfownsalesview/domain/common/model/generic_types.dart';

import '../../common/model/common_response_model.dart';
import '../model/insert_items_collected_req_model.dart';
import '../model/items_collected_response_model.dart';


abstract class ItemsCollectedRepository {
  FutureEither<List<ItemsCollectedResponseModel>> getItemsCollectedList();
  FutureEither<CommonResponseModel> insertItemsCollected(InsertItemsCollectedReqModel insertItemsCollectedReqModel);
  FutureEither<CommonResponseModel> updateItemsCollected(
      InsertItemsCollectedReqModel updateItemsCollectedReqModel);
  FutureEither<CommonResponseModel> deleteItemsCollected(int id);
  FutureEither<List<ItemsCollectedResponseModel>> getItemsCollectedById(int id);
}
