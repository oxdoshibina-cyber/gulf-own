import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../domain/common/model/app_failure.dart';
import '../../../domain/common/model/generic_types.dart';
import '../../../domain/completed_works/model/completed_work_details_res_model.dart';
import '../../../domain/completed_works/model/completed_work_res_model.dart';
import '../../../domain/completed_works/model/service_return_res_model.dart';
import '../../../domain/completed_works/repository/completed_work_repository.dart';
import '../../../packages/app_network/app_network.dart';
import '../../common_dto/api_response_dto.dart';
import '../dtos/completed_work_details_response_dto.dart';
import '../dtos/completed_work_response_dto.dart';
import '../dtos/service_return_response_dto.dart';


class CompletedWorksRepositoryImpl extends CompletedWorkRepository{

  @override
  FutureEither<List<CompletedWorkResponseModel>> getCompletedWorkList(
    String fromDate,
    String toDate,
    String searchQuery,
  ) async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.getCompletedWorkList,
      queryParameters: {
        'fromDate': fromDate,
        'toDate': toDate,
        'search': searchQuery,
      }
    );

    return response.fold(
      (err) {
        return Left(err);
      },
      (success) {
        final responseData =
            ApiResponseDto<List<CompletedWorkResponseModel>>.fromJson(
              success.data,
              dataParser: (json) {
                return (json as List<dynamic>)
                    .map(
                      (e) => CompletedWorkResponseDto.fromJson(
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
  FutureEither<CompletedWorkDetailsResponseModel> getCompletedWorkDetails(int workId) async {
    final response = await AppNetwork.get(
      // url: ApiEndpoints.getCompletedWorkDetails(workId.toString()),
      url: ApiEndpoints.getCompletedWorkDetails,
      queryParameters: {
        'id': workId.toString(),
      }
    );
    return response.fold(
            (err){
          return Left(err);
        },
            (success){
          final responseData = ApiResponseDto<CompletedWorkDetailsResponseModel>.fromJson(
              success.data,
              dataParser: (json){
                return CompletedWorkDetailsResponseDto.fromJson(json).toModel();
              }
          );
          if (responseData.status && responseData.data != null) {
            return Right(responseData.data!);
          } else {
            log(
              "Parsed Error Response: ${responseData.message}",
              name: "Parsed Data",
            );
            return Left(
              AppFailure.server(
                  responseData.message,
                  responseData.statusCode),
            );
          }
        }
    );
  }

  @override
  FutureEither<ServiceReturnResponseModel> insertServiceReturn(int siEntryNo, int asId, String remarks) async {
    final response = await AppNetwork.post(
        url: ApiEndpoints.insertServiceReturn,
        queryParameters: {
          "si_entryno": siEntryNo,
          "as_id": asId,
          "remarks": remarks,
        }
    );
    return response.fold(
            (err) {
          return Left(err);
        },
            (success) {
          final responseData = ApiResponseDto<
              ServiceReturnResponseModel>.fromJson(
              success.data,
            dataParser: (json) {
              if (json is List && json.isNotEmpty) {
                return ServiceReturnResponseDto
                    .fromJson(json.first as Map<String, dynamic>)
                    .toModel();
              }
              return ServiceReturnResponseModel.dummy();
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
              AppFailure.server(
                  responseData.message,
                  responseData.statusCode),
            );
          }
        }
    );
  }

}
