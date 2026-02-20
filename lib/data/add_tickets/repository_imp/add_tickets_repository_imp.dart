import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/data/add_tickets/dtos/get_description_list_dto.dart';
import 'package:gulfownsalesview/data/add_tickets/dtos/get_service_brand_dto.dart';
import 'package:gulfownsalesview/data/add_tickets/dtos/get_service_card_dto.dart';
import 'package:gulfownsalesview/data/add_tickets/dtos/get_service_cash_dto.dart';
import 'package:gulfownsalesview/data/add_tickets/dtos/insert_description_list_dto.dart';
import 'package:gulfownsalesview/data/add_tickets/dtos/insert_ticket_res_dto.dart';
import 'package:gulfownsalesview/data/common_dto/api_response_dto.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_description_list_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_brand_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_card_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/get_service_cash_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_req_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_description_res_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_req_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/model/insert_ticket_res_model.dart';
import 'package:gulfownsalesview/domain/add_tickets/repository/add_tickets_repository.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/packages/app_network/app_network.dart';

class AddTicketsRepositoryImp extends AddTicketsRepository {
  @override
  FutureEither<List<GetServiceBrandModel>> getServiceBrand() async {
    try {
      final response = await AppNetwork.get(url: ApiEndpoints.getServiceBrand);

      return response.fold((err) => Left(err), (success) {
        final responseData =
            ApiResponseDto<List<GetServiceBrandModel>>.fromJson(
              success.data,
              dataParser: (json) {
                // ✅ json is a LIST
                return (json as List)
                    .map((e) => GetServiceBrandDto.fromJson(e).toModel())
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
  FutureEither<InsertTicketResModel> insertTicket(
    InsertTicketReqModel model,
  ) async {
    try {
      /// ✅ MUST await
      final formData = await model.toFormData();

      final response = await AppNetwork.post(
        url: ApiEndpoints.insertTickets,
        data: formData, // ✅ pass FormData directly
      );

      return response.fold((err) => Left(err), (success) {
        final parsed = InsertTicketResDto.fromJson(success.data).toModel();
        return Right(parsed);
      });
    } on DioException catch (e) {
      return Left(
        AppFailure.server(
          e.message ?? "Server error",
          e.response?.statusCode ?? 500,
        ),
      );
    } catch (e) {
      return Left(
        AppFailure.client(
          kDebugMode ? e.toString() : "Unexpected error occurred",
        ),
      );
    }
  }

  @override
  FutureEither<List<GetServiceCashModel>> getServiceCash() async {
    try {
      final response = await AppNetwork.get(url: ApiEndpoints.getServiceCash);

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<List<GetServiceCashModel>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is a LIST
            return (json as List)
                .map((e) => GetServiceCashDto.fromJson(e).toModel())
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
  FutureEither<List<GetDescriptionListModel>> getDescriptionList() async {
    try {
      final response = await AppNetwork.get(url: ApiEndpoints.descriptionList);

      return response.fold((err) => Left(err), (success) {
        final responseData =
            ApiResponseDto<List<GetDescriptionListModel>>.fromJson(
              success.data,
              dataParser: (json) {
                // ✅ json is a LIST
                return (json as List)
                    .map((e) => GetDescriptionListDto.fromJson(e).toModel())
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
  FutureEither<List<InsertDescriptionResModel>> insertDescription(
    InsertDescriptionReqModel insertDescriptionReqModel,
  ) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.insertDescriptionList,
        queryParameters: insertDescriptionReqModel.toMap(),
      );
      return response.fold((err) => Left(err), (success) {
        final responseData =
            ApiResponseDto<List<InsertDescriptionResModel>>.fromJson(
              success.data,
              dataParser: (json) {
                // ✅ json is a LIST
                return (json as List)
                    .map((e) => InsertDescriptionListDto.fromJson(e).toModel())
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
  FutureEither<List<GetServiceCardModel>> getServiceCard() async {
    try {
      final response = await AppNetwork.get(url: ApiEndpoints.getServiceCard);

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<List<GetServiceCardModel>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is a LIST
            return (json as List)
                .map((e) => GetServiceCardDto.fromJson(e).toModel())
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
}
