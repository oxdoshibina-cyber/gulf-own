import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';
import 'package:gulfownsalesview/domain/items_collected/model/insert_items_collected_req_model.dart';
import 'package:gulfownsalesview/domain/items_collected/model/items_collected_response_model.dart';
import 'package:gulfownsalesview/domain/items_collected/repository/items_collected_repository.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../domain/common/model/app_failure.dart';
import '../../../domain/common/model/common_response_model.dart';

import '../../../packages/app_network/app_network.dart';
import '../../common_dto/api_response_dto.dart';
import '../../common_dto/common_response_dto.dart';
import '../dtos/get_items_collected_response_dto.dart';
import '../dtos/insert_items_collected_res_dto.dart';

class ItemsCollectedRepositoryImpl extends ItemsCollectedRepository{
  @override
  FutureEither<List<ItemsCollectedResponseModel>> getItemsCollectedList() async{
    final response = await AppNetwork.get(
      url: ApiEndpoints.getItemsCollected,
    );

    return response.fold(
            (err){
              return Left(err);
            },
            (success){
              final responseData = ApiResponseDto<List<ItemsCollectedResponseModel>>.fromJson(
                success.data,
                dataParser: (json){
                  return (json as List<dynamic>).map(
                      (e) => GetItemsCollectedResponseDto.fromJson(e as Map<String, dynamic>).toModel()
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
  FutureEither<CommonResponseModel> insertItemsCollected(
      InsertItemsCollectedReqModel req) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.insertItemsCollected,
        data: req.toMap(),
      );

      return response.fold(
            (err) => Left(err),
            (success) {
          final responseData =
          ApiResponseDto<List<CommonResponseModel>>.fromJson(
            success.data,
            dataParser: (json) {
              final list = json as List;
              return list
                  .map((e) =>
                  InsertItemsCollectedResDto.fromJson(e).toModel())
                  .toList();
            },
          );

          if (responseData.status && responseData.data != null) {
            final result = responseData.data!.first;

            if (result.status == "FAILED") {
              return Left(
                AppFailure.server(
                    result.message, responseData.statusCode),
              );
            }

            return Right(result);
          }

          return Left(
            AppFailure.server(
                responseData.message, responseData.statusCode),
          );
        },
      );
    } catch (e) {
      log(
        "Unexpected Error: $e",
        name: "Accept Partner RepositoryImp > Accept Partner Model",
      );
      return Left(
        AppFailure.client(
            kDebugMode ? e.toString() : "Something went wrong"),
      );
    }
  }


  // @override
  // FutureEither<CommonResponseModel> insertItemsCollected(
  //     InsertItemsCollectedReqModel insertItemsCollectedReqModel) async {
  //   try {
  //     final response = await AppNetwork.post(
  //       url: ApiEndpoints.insertItemsCollected,
  //       data: insertItemsCollectedReqModel.toMap(),
  //       // queryParameters: insertItemsCollectedReqModel.toMap(),
  //     );
  //     return response.fold(
  //             (err) {
  //           return Left(err);
  //         },
  //             (success) {
  //           final responseData = ApiResponseDto<CommonResponseModel>.fromJson(
  //               success.data,
  //               dataParser: (json) {
  //                 return InsertItemsCollectedResDto.fromJson(json).toModel();
  //               }
  //           );
  //           if (responseData.status && responseData.data != null) {
  //             return Right(responseData.data!);
  //           } else {
  //             log(
  //               "Parsed Error Response: ${responseData.message}",
  //               name: "Parsed Data",
  //             );
  //             return Left(
  //               AppFailure.server(
  //                   responseData.message, responseData.statusCode),
  //             );
  //           }
  //         });
  //   }
  //       catch(e){
  //         log(
  //           "Unexpected Error: $e",
  //           name: "Accept Partner RepositoryImp > Accept Partner Model",
  //         );
  //         return Left(
  //           AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
  //         );
  //       }
  // }

  @override
  FutureEither<List<ItemsCollectedResponseModel>> getItemsCollectedById(int id) async {
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.getItemsCollectedById}/$id',
    );

    return response.fold(
          (err) => Left(err),
          (success) {
        final responseData =
        ApiResponseDto<List<ItemsCollectedResponseModel>>.fromJson(
          success.data,
          dataParser: (json) {
            return (json as List).map(
                  (e) => GetItemsCollectedResponseDto.fromJson(
                e as Map<String, dynamic>,
              ).toModel(),
            ).toList();
          },
        );


        //     final list = json as List;
        //
        //     if (list.isEmpty) {
        //       throw Exception('No item found for id $id');
        //     }
        //
        //     return GetItemsCollectedResponseDto.fromJson(
        //       list.first as Map<String, dynamic>,
        //     ).toModel();
        //   },
        // );

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
  }


  // @override
  // FutureEither<ItemsCollectedResponseModel> getItemsCollectedById(int id) async{
  //   final response = await AppNetwork.get(
  //     // url: ApiEndpoints.getItemsCollectedById,
  //     // queryParameters: {'id': id},
  //     url: '${ApiEndpoints.getItemsCollectedById}/$id',
  //   );
  //   return response.fold(
  //           (err){
  //         return Left(err);
  //       },
  //           (success){
  //         final responseData = ApiResponseDto<ItemsCollectedResponseModel>.fromJson(
  //             success.data,
  //             dataParser: (json){
  //               return GetItemsCollectedResponseDto.fromJson(json).toModel();
  //             }
  //         );
  //         if (responseData.status && responseData.data != null) {
  //           return Right(responseData.data!);
  //         } else {
  //           log(
  //             "Parsed Error Response: ${responseData.message}",
  //             name: "Parsed Data",
  //           );
  //           return Left(
  //             AppFailure.server(responseData.message, responseData.statusCode),
  //           );
  //         }
  //       });
  // }
///
//   @override
//   FutureEither<CommonResponseModel> updateItemsCollected(
//       InsertItemsCollectedReqModel updateItemsCollectedReqModel) async {
//     try {
//       final response = await AppNetwork.post(
//         url: ApiEndpoints.updateQclist,
//         data: updateItemsCollectedReqModel.toMap(),
//       );
//
//       return response.fold((err) => Left(err), (success) {
//         final responseData = ApiResponseDto<CommonResponseModel>.fromJson(
//           success.data,
//           dataParser: (json) {
//             return CommonResponseDto.fromJson(json).toModel();
//           },
//         );
//
//         if (responseData.status && responseData.data != null) {
//           return Right(responseData.data!);
//         } else {
//           return Left(
//             AppFailure.server(responseData.message, responseData.statusCode),
//           );
//         }
//       });
//     } catch (e) {
//       return Left(
//         AppFailure.client(kDebugMode ? e.toString() : "Something went wrong"),
//       );
//     }
//   }

  @override
  FutureEither<CommonResponseModel> updateItemsCollected(
      InsertItemsCollectedReqModel updateItemsCollectedReqModel) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.updateItemsCollected,
        data: updateItemsCollectedReqModel.toMap(),
      );

      return response.fold(
            (err) => Left(err),
            (success) {
          final responseData =
          ApiResponseDto<List<CommonResponseModel>>.fromJson(
            success.data,
            dataParser: (json) {
              return (json as List)
                  .map(
                    (e) =>
                    InsertItemsCollectedResDto.fromJson(e).toModel(),
              )
                  .toList();
            },
          );

          // 🔴 IMPORTANT: validate INNER status
          if (responseData.status &&
              responseData.data != null &&
              responseData.data!.isNotEmpty &&
              responseData.data!.first.status.toUpperCase() == "SUCCESS") {
            return Right(responseData.data!.first);
          } else {
            return Left(
              AppFailure.server(
                responseData.data?.first.message ??
                    "Update failed",
                responseData.statusCode,
              ),
            );
          }
        },
      );
    } catch (e) {
      return Left(
        AppFailure.client(
          kDebugMode ? e.toString() : "Something went wrong",
        ),
      );
    }
  }

@override
  FutureEither<CommonResponseModel> deleteItemsCollected(int id) async {
    try {
      final response = await AppNetwork.post(
        url: ApiEndpoints.deleteItemsCollected(id),
      );
      return response.fold(
              (err) => Left(err),
              (success) {
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
                AppFailure.server(
                  responseData.message,
                  responseData.statusCode,
                ),
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