import 'package:gulfownsalesview/domain/tech_dashboard/model/spare_parts_history.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spare_part_history_dto.g.dart';

@JsonSerializable()
class SparePartHistoryDto {
  @JsonKey(name: "SpareName")
  final String? spareName;

  @JsonKey(name: "CustomerName")
  final String? customerName;

  @JsonKey(name: "Date")
  final String? date;

  @JsonKey(name: "Price")
  final double? price;

  const SparePartHistoryDto({
    this.spareName,
    this.customerName,
    this.date,
    this.price,
  });

  factory SparePartHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$SparePartHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SparePartHistoryDtoToJson(this);

  /// 🔁 DTO → Domain
  SparePartHistoryModel toModel() {
    return SparePartHistoryModel(
      spareName: spareName ?? '',
      customerName: customerName ?? '',
      date: date ?? '',
      price: price ?? 0,
    );
  }
}
