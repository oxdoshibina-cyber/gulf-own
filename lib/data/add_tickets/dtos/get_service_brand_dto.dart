import 'package:gulfownsalesview/domain/add_tickets/model/get_service_brand_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_service_brand_dto.g.dart';

@JsonSerializable()
class GetServiceBrandDto {
  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'company_name')
  final String? companyName;

  @JsonKey(name: 'company_remarks')
  final String? companyRemarks;

  const GetServiceBrandDto({
    this.companyId,
    this.companyName,
    this.companyRemarks,
  });

  factory GetServiceBrandDto.fromJson(Map<String, dynamic> json) =>
      _$GetServiceBrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceBrandDtoToJson(this);

  GetServiceBrandModel toModel() {
    return GetServiceBrandModel(
      companyId: companyId ?? -1,
      companyName: companyName ?? '',
      companyRemarks: companyRemarks ?? '',
    );
  }
}
