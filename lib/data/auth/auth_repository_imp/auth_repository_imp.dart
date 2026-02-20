import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/domain/auth/model/app_auth_req_model.dart';
import 'package:gulfownsalesview/domain/auth/model/app_auth_res_model.dart';
import 'package:gulfownsalesview/domain/auth/model/location_model.dart';
import 'package:gulfownsalesview/domain/auth/model/user_auth_req_model.dart';
import 'package:gulfownsalesview/domain/auth/model/user_auth_res_model.dart';
import 'package:gulfownsalesview/domain/auth/repository/auth_repository.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/packages/app_network/app_network.dart';
import 'package:gulfownsalesview/data/auth/dtos/auth_app_response_dto.dart';
import 'package:gulfownsalesview/data/auth/dtos/user_auth_response_dto.dart';
import 'package:gulfownsalesview/data/auth/dtos/location_dto.dart';

class AuthRepositoryImp extends AuthRepository {
  /// 🔹 App Auth: Get App Token
  @override
  FutureEither<AppAuthResModel> appAuth(AppAuthReqModel reqModel) async {
    try {
      final response = await AppNetwork.post(
        url: "${ApiEndpoints.baseUrl}${ApiEndpoints.appAuth}",
        body: reqModel.toMap(),
      );

      return response.fold((err) => Left(err), (success) {
        dynamic json = success.data;

        if (json is String) {
          json = jsonDecode(json);
        }

        if (json == null || json is! Map<String, dynamic>) {
          return Left(AppFailure.server("Invalid response format", 500));
        }

        final dto = AuthAppResponseDto.fromJson(json);

        // Extract actual token from inner JSON list
        String appToken = "";
        try {
          final decodedList = jsonDecode(dto.token); // string → list
          appToken = decodedList[0]['value'];
        } catch (e) {
          log("App Auth token decode failed: $e");
          return Left(AppFailure.server("Token decode failed", 500));
        }

        return Right(AppAuthResModel(token: appToken, status: dto.status));
      });
    } catch (e) {
      log("AppAuth Unexpected Error: $e");
      return Left(AppFailure.client("Something went wrong"));
    }
  }

  /// 🔹 User Auth: Get User Token
  @override
  FutureEither<UserAuthResModel> userAuth(UserAuthReqModel reqModel) async {
    try {
      final response = await AppNetwork.post(
        url: "${ApiEndpoints.baseUrl}${ApiEndpoints.userAuth}",
        body: reqModel.toMap(),
      );

      return response.fold((err) => Left(err), (success) {
        dynamic json = success.data;

        if (json is String) {
          json = jsonDecode(json);
        }

        if (json == null || json is! Map<String, dynamic>) {
          return Left(AppFailure.server("Invalid response format", 500));
        }

        final dto = UserAuthResponseDto.fromJson(json);

        // Directly use token (usually it's a string, not array)
        final model = UserAuthResModel(
          token: dto.token,
          status: dto.status,
          expiration: dto.expiration,
          userRole: dto.userRole,
        );

        return Right(model);
      });
    } catch (e) {
      log("UserAuth Unexpected Error: $e");
      return Left(AppFailure.client("Something went wrong"));
    }
  }

  /// 🔹 Get branches after user login
  @override
  FutureEither<LocationModel> getBranches() async {
    try {
      final response = await AppNetwork.get(
        url: "${ApiEndpoints.baseUrl}${ApiEndpoints.userLocations}",
      );

      return response.fold((err) => Left(err), (success) {
        dynamic json = success.data;
        if (json is String) json = jsonDecode(json);

        if (json is Map<String, dynamic>) {
          final model = LocationDto.fromJson(json).toModel();
          return Right(model);
        } else {
          return Left(AppFailure.server("Invalid response format", 500));
        }
      });
    } catch (e) {
      return Left(AppFailure.client("Something went wrong"));
    }
  }
}
