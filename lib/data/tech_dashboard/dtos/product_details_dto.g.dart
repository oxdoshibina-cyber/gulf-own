// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsDto _$ProductDetailsDtoFromJson(Map<String, dynamic> json) =>
    ProductDetailsDto(
      (json['ir_id'] as num?)?.toInt(),
      json['ir_name'] as String?,
      (json['ir_cgst'] as num?)?.toDouble(),
      (json['ir_sgst'] as num?)?.toDouble(),
      json['qty'] as String?,
      (json['uniquecode'] as num?)?.toDouble(),
      json['prate'] as String?,
      json['mrp'] as String?,
      json['wholesale'] as String?,
      json['spretail'] as String?,
      json['branch'] as String?,
      json['retail'] as String?,
      json['realprate'] as String?,
      json['cost'] as String?,
    );

Map<String, dynamic> _$ProductDetailsDtoToJson(ProductDetailsDto instance) =>
    <String, dynamic>{
      'ir_id': instance.irId,
      'ir_name': instance.irName,
      'ir_cgst': instance.irCgst,
      'ir_sgst': instance.irSgst,
      'qty': instance.qty,
      'uniquecode': instance.uniqueCode,
      'prate': instance.pRate,
      'mrp': instance.mrp,
      'wholesale': instance.wholeSale,
      'spretail': instance.spRetail,
      'branch': instance.branch,
      'retail': instance.retail,
      'realprate': instance.realPrate,
      'cost': instance.cost,
    };
