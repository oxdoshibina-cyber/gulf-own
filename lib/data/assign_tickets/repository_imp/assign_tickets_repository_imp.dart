import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/data/assign_tickets/dtos/get_tickets_by_id_res_dto.dart';
import 'package:gulfownsalesview/data/assign_tickets/dtos/get_tickets_res_dto.dart';
import 'package:gulfownsalesview/data/common_dto/api_response_dto.dart';
import 'package:gulfownsalesview/data/common_dto/common_response_dto.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/assign_technician_req_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_req_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_by_id_res_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/model/get_tickets_res_model.dart';
import 'package:gulfownsalesview/domain/assign_tickets/repository/assign_tickets_repository.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';
import 'package:gulfownsalesview/domain/common/model/common_response_model.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/packages/app_network/app_network.dart';

class AssignTicketsRepositoryImp extends AssignTicketsRepository {
  @override
  FutureEither<List<GetTicketsResModel>> getTicketList(String status) async {
    try {
      final response = await AppNetwork.get(
        url: ApiEndpoints.getTickets,
        queryParameters: {"status": status},
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<List<GetTicketsResModel>>.fromJson(
          success.data,
          dataParser: (json) {
            // ✅ json is a LIST
            return (json as List)
                .map((e) => GetTicketsDto.fromJson(e).toModel())
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
  FutureEither<GetTicketsByIdResModel> getTicketById(
    GetTicketsByIdReqModel model,
  ) async {
    try {
      final response = await AppNetwork.get(
        url: ApiEndpoints.getTicketById,
        queryParameters: model.toMap(),
      );

      return response.fold((err) => Left(err), (success) {
        final responseData = ApiResponseDto<GetTicketsByIdResModel>.fromJson(
          success.data,
          dataParser: (json) {
            return GetTicketsByIdResDto.fromJson(json).toModel();
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
  FutureEither<CommonResponseModel> assignTechnician(
    AssignTechnicianReqModel model,
  ) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.assignTechnician,
        queryParameters: model.toMap(),
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
