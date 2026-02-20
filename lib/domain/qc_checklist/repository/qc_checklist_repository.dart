import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/get_qc_checklist_model.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/insert_update_qc_checklist_req_model.dart';

abstract class QcChecklistRepository {
  FutureEither<List<GetQcChecklistModel>> getQcCheckList();
  FutureEither<CommonResponseModel> insertQcCheckList(
    InsertUpdateQcChecklistReqModel insertQcChecklistModel,
  );
  FutureEither<CommonResponseModel> updateQcCheckList(
    InsertUpdateQcChecklistReqModel updateQcChecklistModel,
  );
  FutureEither<CommonResponseModel> deleteQcCheckList(int id);
  FutureEither<List<GetQcChecklistModel>> fetchQcCheckList(int id);
}
