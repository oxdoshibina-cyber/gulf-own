// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_part_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparePartHistoryDto _$SparePartHistoryDtoFromJson(Map<String, dynamic> json) =>
    SparePartHistoryDto(
      spareName: json['SpareName'] as String?,
      customerName: json['CustomerName'] as String?,
      date: json['Date'] as String?,
      price: (json['Price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SparePartHistoryDtoToJson(
  SparePartHistoryDto instance,
) => <String, dynamic>{
  'SpareName': instance.spareName,
  'CustomerName': instance.customerName,
  'Date': instance.date,
  'Price': instance.price,
};
