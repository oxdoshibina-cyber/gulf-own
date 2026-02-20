  // final AppPaginationDto pagination;
import 'dart:convert';

class ApiResponseDto<T> {
  final bool status;
  final int statusCode;
  final String message;
  final T? data;
  // final AppPaginationDto pagination;

  const ApiResponseDto({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    // this.pagination = const AppPaginationDto(),
  });

  factory ApiResponseDto.fromJson(
    dynamic json, {
    T Function(dynamic json)? dataParser,
    Function(dynamic json)? pagination,
  }) {
    late final dynamic raw;

    // if (json is Map) {
    //   raw = json as Map<String, dynamic>;
    // } else {
    //   raw = jsonDecode(json);
    // }
    if (json is Map<String, dynamic>) {
      raw = json;
    } else if (json is String) {
      raw = jsonDecode(json) as Map<String, dynamic>;
    } else {
      throw Exception(
        'ApiResponseDto: Expected Map<String, dynamic> but got ${json.runtimeType}',
      );
    }

    // log(jsonEncode(raw));

    return ApiResponseDto(
      status: raw["status"] as bool,
      statusCode: (raw["statusCode"] as num?)?.toInt() ?? 0,
      message: raw["message"] as String? ?? "",
      data: dataParser?.call(raw["data"]),
      // pagination: AppPaginationDto<T>.fromJson(raw),
    );
  }
}
