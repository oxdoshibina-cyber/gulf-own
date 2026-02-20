import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:gulfownsalesview/data/spare_allocation/dtos/get_spare_request_list_res_dto.dart';
import 'package:gulfownsalesview/domain/spare_allocation/model/get_spare_detailed_res_model.dart';
import 'package:gulfownsalesview/domain/spare_allocation/repository/spare_allocation_repository.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../domain/common/model/generic_types.dart';
import '../../../domain/spare_allocation/model/get_spare_request_list_res_model.dart';
import '../../../packages/app_network/app_network.dart';
import '../../common_dto/api_response_dto.dart';

import '../../../domain/common/model/app_failure.dart';
import '../../../domain/common/model/common_response_model.dart';
import '../dtos/get_spare_detailed_res_dto.dart';

class SpareAllocationRepositoryImpl extends SpareAllocationRepository {
  @override
  FutureEither<List<GetSpareRequestListResponseModel>> getSpareRequestList() async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.getSpareRequestList,
    );

    return response.fold(
            (err) {
          return Left(err);
        },
            (success) {
          final responseData = ApiResponseDto<
              List<GetSpareRequestListResponseModel>>.fromJson(
              success.data,
              dataParser: (json) {
                return (json as List<dynamic>).map(
                        (e) =>
                        GetSpareRequestListResponseDto.fromJson(
                            e as Map<String, dynamic>).toModel()
                ).toList();
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
              AppFailure.server(responseData.message, responseData.statusCode),
            );
          }
        });
  }

  @override
  FutureEither<GetSpareDetailedResponseModel> getSpareDetailed(int siEntryNo) async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.getSpareRequestDetails,
        queryParameters: {
        "si_entryno": siEntryNo,
      },);

    return response.fold(
      (error){
        return Left(error);
      },
        (success){
        final responseData = ApiResponseDto<GetSpareDetailedResponseModel>.fromJson(
            success.data,
            dataParser: (json){
              return GetSpareDetailedResponseDto.fromJson(json).toModel();
            });
        if(responseData.status && responseData.data != null){
          return Right(responseData.data!);
        }
        else {
          log(
            "Parsed Error Response: ${responseData.message}",
            name: "Parsed Data",
          );
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }

        }
     );
  }
}
