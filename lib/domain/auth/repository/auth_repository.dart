import 'package:gulfownsalesview/domain/auth/model/app_auth_req_model.dart';
import 'package:gulfownsalesview/domain/auth/model/app_auth_res_model.dart';
import 'package:gulfownsalesview/domain/auth/model/location_model.dart';
import 'package:gulfownsalesview/domain/auth/model/user_auth_req_model.dart';
import 'package:gulfownsalesview/domain/auth/model/user_auth_res_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';

abstract class AuthRepository {
  FutureEither<AppAuthResModel> appAuth(AppAuthReqModel reqModel);
  FutureEither<UserAuthResModel> userAuth(UserAuthReqModel reqModel);
  FutureEither<LocationModel> getBranches();
}
