import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/data/common_dto/api_response_dto.dart';
import 'package:gulfownsalesview/data/common_dto/common_response_dto.dart';
import 'package:gulfownsalesview/data/qc_checklist/dtos/get_qc_checklist_dto.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/get_qc_checklist_model.dart';
import 'package:gulfownsalesview/domain/qc_checklist/model/insert_update_qc_checklist_req_model.dart';
import 'package:gulfownsalesview/domain/qc_checklist/repository/qc_checklist_repository.dart';
import 'package:gulfownsalesview/packages/app_network/app_network.dart';

class QcChecklistRepositoryImp extends QcChecklistRepository {
  @override
  FutureEither<List<GetQcChecklistModel>> getQcCheckList() async {
    final response = await AppNetwork.get(url: ApiEndpoints.getQclist);

    return response.fold(
      (err) {
        return Left(err);
      },
      (success) {
        final responseData = ApiResponseDto<List<GetQcChecklistModel>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is List<dynamic>
            return (json as List<dynamic>)
                .map(
                  (e) => GetQcChecklistDto.fromJson(
                    e as Map<String, dynamic>,
                  ).toModel(),
                )
                .toList();
          },
        );

        if (responseData.status && responseData.data != null) {
          return Right(responseData.data!);
        } else {
          log(
            "Parsed Error Response: ${responseData.message}",
            name: "Parsed Data",
          );
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }
      },
    );
  }

  @override
  FutureEither<CommonResponseModel> deleteQcCheckList(int id) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.getdeleteQclist(id),
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<CommonResponseModel>.fromJson(
          success.data,
          dataParser: (json) {
            return CommonResponseDto.fromJson(json).toModel();
          },
        );

        if (responseData.status && responseData.data != null) {
          return Right(responseData.data!);
        } else {
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }
      });
    } catch (e) {
      return Left(
        AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
      );
    }
  }

  @override
  FutureEither<List<GetQcChecklistModel>> fetchQcCheckList(int id) async {
    try {
      final response = await AppNetwork.get(
        url: ApiEndpoints.getQclistById(id),
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<List<GetQcChecklistModel>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is a LIST
            return (json as List)
                .map((e) => GetQcChecklistDto.fromJson(e).toModel())
                .toList();
          },
        );

        if (responseData.status && responseData.data != null) {
          return Right(responseData.data!);
        } else {
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }
      });
    } catch (e) {
      return Left(
        AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
      );
    }
  }

  @override
  FutureEither<CommonResponseModel> insertQcCheckList(
    InsertUpdateQcChecklistReqModel insertQcChecklistModel,
  ) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.insertQclist,
        data: insertQcChecklistModel.toMap(),
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<CommonResponseModel>.fromJson(
          success.data,
          dataParser: (json) {
            return CommonResponseDto.fromJson(json).toModel();
          },
        );

        if (responseData.status && responseData.data != null) {
          return Right(responseData.data!);
        } else {
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }
      });
    } catch (e) {
      return Left(
        AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
      );
    }
  }

  @override
  FutureEither<CommonResponseModel> updateQcCheckList(
    InsertUpdateQcChecklistReqModel updateQcChecklistModel,
  ) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.updateQclist,
        data: updateQcChecklistModel.toMap(),
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<CommonResponseModel>.fromJson(
          success.data,
          dataParser: (json) {
            return CommonResponseDto.fromJson(json).toModel();
          },
        );

        if (responseData.status && responseData.data != null) {
          return Right(responseData.data!);
        } else {
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }
      });
    } catch (e) {
      return Left(
        AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
      );
    }
  }
}
