import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/data/add_tickets/dtos/insert_ticket_res_dto.dart';
import 'package:gulfownsalesview/data/common_dto/api_response_dto.dart';
import 'package:gulfownsalesview/data/common_dto/common_response_dto.dart';
import 'package:gulfownsalesview/data/tech_dashboard/dtos/insert_spare_res_dto.dart';
import 'package:gulfownsalesview/data/tech_dashboard/dtos/product_details_dto.dart';
import 'package:gulfownsalesview/data/tech_dashboard/dtos/spare_list_dto.dart';
import 'package:gulfownsalesview/data/tech_dashboard/dtos/spare_part_history_dto.dart';
import 'package:gulfownsalesview/data/tech_dashboard/dtos/technician_dashboard_res_dto.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_res_model.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/insert_spare_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/product_details_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/relocate_technician_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_list_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_parts_history.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/technician_dashboard_res_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/model/update_technician_status_req_model.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/repository/tech_dashboard_repository.dart';
import 'package:gulfownsalesview/packages/app_network/app_network.dart';

class TechnicianDashboardRepositoryImp extends TechDashboardRepository {
  @override
  FutureEither<List<SpareListModel>> getSpareList() async {
    final response = await AppNetwork.get(url: ApiEndpoints.spareList);

    return response.fold(
      (err) {
        return Left(err);
      },
      (success) {
        final responseData = ApiResponseDto<List<SpareListModel>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is List<dynamic>
            return (json as List<dynamic>)
                .map(
                  (e) => SpareListDto.fromJson(
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
  FutureEither<List<SparePartHistoryModel>> getSparePartsHistory(int id) async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.sparePartsHistory,
      queryParameters: {"ir_id": id.toString()},
    );

    return response.fold(
      (err) {
        return Left(err);
      },
      (success) {
        final responseData =
            ApiResponseDto<List<SparePartHistoryModel>>.fromJson(
              success.data,
              dataParser: (json) {
                // ✅ json is List<dynamic>
                return (json as List<dynamic>)
                    .map(
                      (e) => SparePartHistoryDto.fromJson(
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
  FutureEither<TechnicianDashboardResModel> getTechnicianDashboard(
    int id,
  ) async {
    try {
      final response = await AppNetwork.get(
        url: ApiEndpoints.technicianDashboard,
        queryParameters: {"id": id.toString()},
      );

      return response.fold((err) => Left(err), (success) {
        final responseData =
            ApiResponseDto<TechnicianDashboardResModel>.fromJson(
              success.data,
              dataParser: (json) {
                return TechnicianDashboardResDto.fromJson(json).toModel();
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
  FutureEither<List<InsertSpareResModel>> insertSpare(
    InsertSpareReqModel insertSpareReqModel,
  ) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.insertSpare,
        body: insertSpareReqModel.toMap(), // ✅ BODY
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<List<InsertSpareResModel>>.fromJson(
          success.data,
          dataParser: (json) {
            return (json as List<dynamic>)
                .map(
                  (e) => InsertSpareResDto.fromJson(
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
  FutureEither<CommonResponseModel> relocateTechnician(
    RelocateTechnicianReqModel relocateTechnicianReqModel,
  ) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.relocateTechnician,
        queryParameters: relocateTechnicianReqModel.toMap(), // ✅ BODY
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<CommonResponseModel>.fromJson(
          success.data,
          dataParser: (json) {
            // 🔥 CASE 1: backend returns []
            if (json is List) {
              return const CommonResponseModel(
                status: "true",
                message: "Relocated successfully",
              );
            }

            // ✅ CASE 2: backend returns object
            if (json is Map<String, dynamic>) {
              return CommonResponseDto.fromJson(json).toModel();
            }

            // ❌ SAFETY FALLBACK
            return const CommonResponseModel(
              status: "false",
              message: "Unexpected response from server",
            );
          },
        );

        // ✅ SUCCESS
        if (responseData.data != null) {
          return Right(responseData.data!);
        }

        // ❌ FAILURE
        return Left(
          AppFailure.server(responseData.message, responseData.statusCode),
        );
      });
    } catch (e) {
      return Left(
        AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
      );
    }
  }

  @override
  FutureEither<CommonResponseModel> updateTechnicianStatus(
    UpdateTicketStatusReqModel updateTicketStatusReqModel,
  ) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.updateTechnicianStatus,
        body: updateTicketStatusReqModel.toMap(), // ✅ BODY
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

  FutureEither<List<ProductDetailsResModel>> productDetails(int id) async {
    final response = await AppNetwork.get(
      url: ApiEndpoints.productDetails(id), // ✅ ONLY PATH PARAM
    );

    return response.fold((err) => Left(err), (success) {
      final raw = success.data is String
          ? jsonDecode(success.data)
          : success.data;

      final List productList = raw["product"] ?? [];

      if (productList.isEmpty) {
        return const Right([]);
      }

      final products = productList
          .map(
            (e) =>
                ProductDetailsDto.fromJson(e as Map<String, dynamic>).toModel(),
          )
          .toList();

      return Right(products);
    });
  }
}
