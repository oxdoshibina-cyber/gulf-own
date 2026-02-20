import 'package:gulfownsalesview/domain/tech_dashboard/model/product_details_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_details_dto.g.dart';

@JsonSerializable()
class ProductDetailsDto {
  @JsonKey(name: "ir_id")
  final int? irId;
  @JsonKey(name: "ir_name")
  final String? irName;
  @JsonKey(name: "ir_cgst")
  final double? irCgst;
  @JsonKey(name: "ir_sgst")
  final double? irSgst;
  @JsonKey(name: "qty")
  final String? qty;
  @JsonKey(name: "uniquecode")
  final double? uniqueCode;
  @JsonKey(name: "prate")
  final String? pRate;
  @JsonKey(name: "mrp")
  final String? mrp;
  @JsonKey(name: "wholesale")
  final String? wholeSale;
  @JsonKey(name: "spretail")
  final String? spRetail;
  @JsonKey(name: "branch")
  final String? branch;
  @JsonKey(name: "retail")
  final String? retail;
  @JsonKey(name: "realprate")
  final String? realPrate;
  @JsonKey(name: "cost")
  final String? cost;

  const ProductDetailsDto(
    this.irId,
    this.irName,
    this.irCgst,
    this.irSgst,
    this.qty,
    this.uniqueCode,
    this.pRate,
    this.mrp,
    this.wholeSale,
    this.spRetail,
    this.branch,
    this.retail,
    this.realPrate,
    this.cost,
  );

  factory ProductDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsDtoToJson(this);

  /// 🔁 DTO → Domain
  ProductDetailsResModel toModel() {
    return ProductDetailsResModel(
      irId: irId ?? -1,
      irName: irName ?? "",
      irCgst: irCgst ?? -1,
      irSgst: irSgst ?? -1,
      qty: qty ?? '',
      uniqueCode: uniqueCode ?? -1,
      pRate: pRate ?? '',
      mrp: mrp ?? '',
      wholeSale: wholeSale ?? '',
      spRetail: spRetail ?? '',
      branch: branch ?? '',
      retail: retail ?? '',
      realPrate: realPrate ?? '',
      cost: cost ?? '',
    );
  }
}
