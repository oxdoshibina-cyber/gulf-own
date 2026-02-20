import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/data/common_dto/api_response_dto.dart';
import 'package:gulfownsalesview/data/common_dto/common_response_dto.dart';
import 'package:gulfownsalesview/data/register_complaint/dtos/get_service_category_dto.dart';
import 'package:gulfownsalesview/data/register_complaint/dtos/get_service_complaint_dto.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_category.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/get_service_complaint.dart';
import 'package:gulfownsalesview/domain/register_complaint/model/insert_service_complaint_req_model.dart';
import 'package:gulfownsalesview/domain/register_complaint/repository/register_complaint_repository.dart';
import 'package:gulfownsalesview/packages/app_network/app_network.dart';

class RegisterComplaintRepositoryImp extends RegisterComplaintRepository {
  @override
  FutureEither<List<GetServiceComplaint>> getServiceComplaintList() async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.getServiceComplaint,
    );

    return response.fold(
      (err) {
        return Left(err);
      },
      (success) {
        final responseData = ApiResponseDto<List<GetServiceComplaint>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is List<dynamic>
            return (json as List<dynamic>)
                .map(
                  (e) => GetServiceComplaintDto.fromJson(
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
  FutureEither<List<GetServiceComplaint>> getAllCustomers() async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.getAllCustomers,
    );

    return response.fold(
            (err) {
          return Left(err);
        },
            (success) {
          final responseData = ApiResponseDto<List<GetServiceComplaint>>.fromJson(
            success.data,
            dataParser: (json) {
              // ✅ json is List<dynamic>
              return (json as List<dynamic>)
                  .map(
                    (e) => GetServiceComplaintDto.fromJson(
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
FutureEither<CommonResponseModel> insertServiceComplaint(
  InsertServiceComplaintReqModel insertServiceComplaintReqModel,
) async {
  try {
    final response = await AppNetwork.post(
      url: ApiEndpoints.insertServiceComplaint,
      body: insertServiceComplaintReqModel.toMap(), // ✅ BODY
    );

    return response.fold(
      (err) => Left(err),
      (success) {
        final responseData =
            ApiResponseDto<CommonResponseModel>.fromJson(
          success.data,
          dataParser: (json) {
            return CommonResponseDto.fromJson(json).toModel();
          },
        );

        if (responseData.status && responseData.data != null) {
          return Right(responseData.data!);
        } else {
          return Left(
            AppFailure.server(
              responseData.message,
              responseData.statusCode,
            ),
          );
        }
      },
    );
  } catch (e) {
    return Left(
      AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
    );
  }
}


  @override
  FutureEither<List<GetServiceComplaint>> getServiceComplaintMobile(
    String mobile,
  ) async {
    try {
      final response = await AppNetwork.get(
        url: '${ApiEndpoints.getServiceComplaintByMobile}/$mobile',
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<List<GetServiceComplaint>>.fromJson(
          success.data,
          dataParser: (json) {
            /// ✅ json is List<dynamic>
            return (json as List<dynamic>)
                .map(
                  (e) => GetServiceComplaintDto.fromJson(
                    e as Map<String, dynamic>,
                  ).toModel(),
                )
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
  FutureEither<List<GetServiceCategory>> getServiceCategory() async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.getServiceCategory,
    );

    return response.fold(
      (err) {
        return Left(err);
      },
      (success) {
        final responseData = ApiResponseDto<List<GetServiceCategory>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is List<dynamic>
            return (json as List<dynamic>)
                .map(
                  (e) => GetServiceCategoryDto.fromJson(
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
}
