import 'package:gulfownsalesview/domain/register_complaint/model/get_service_complaint.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_service_complaint_dto.g.dart';

@JsonSerializable()
class GetServiceComplaintDto {
  @JsonKey(name: "scr_id")
  final int? scrId;
  @JsonKey(name: "scr_token_no")
  final int? scrTokenNo;
  @JsonKey(name: "scr_token_date")
  final String? scrTokenDate;
  @JsonKey(name: "scr_customer_name")
  final String? scrCustomerName;
  @JsonKey(name: "scr_mobile_no")
  final String? scrMobileNo;
  @JsonKey(name: "scr_email")
  final String? scrEmail;
  @JsonKey(name: "scr_contact_no")
  final String? scrContactNo;
  @JsonKey(name: "scr_category_id")
  final int? scrCategoryId;
  @JsonKey(name: "scr_customer_address")
  final String? scrCustomerAddress;
  @JsonKey(name: "scr_findings")
  final String? scrFindings;
  @JsonKey(name: "scr_is_ledger")
  final bool? srcIsLedger;
  @JsonKey(name: "scr_ledger_id")
  final int? srcLedgerId;
  @JsonKey(name: "scr_created_date")
  final String? scrCreatedDate;
  @JsonKey(name: "scr_created_by")
  final int? scrCreatedBy;
  @JsonKey(name: "scr_updated_date")
  final String? scrUpdatedDate;
  @JsonKey(name: "scr_updated_by")
  final String? scrUpdatedBy;

  factory GetServiceComplaintDto.fromJson(Map<String, dynamic> json) =>
      _$GetServiceComplaintDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceComplaintDtoToJson(this);

  GetServiceComplaintDto({
    required this.scrId,
    required this.scrTokenNo,
    required this.scrTokenDate,
    required this.scrCustomerName,
    required this.scrMobileNo,
    required this.scrEmail,
    required this.scrContactNo,
    required this.scrCategoryId,
    required this.scrCustomerAddress,
    required this.scrFindings,
    required this.srcIsLedger,
    required this.srcLedgerId,
    required this.scrCreatedDate,
    required this.scrCreatedBy,
    required this.scrUpdatedDate,
    required this.scrUpdatedBy,
  });

  GetServiceComplaint toModel() {
    return GetServiceComplaint(
      scrId: scrId ?? -1,
      scrTokenNo: scrTokenNo ?? 0,
      scrTokenDate: scrTokenDate ?? "",
      scrCustomerName: scrCustomerName ?? "",
      scrMobileNo: scrMobileNo ?? "",
      scrEmail: scrEmail ?? "",
      scrContactNo: scrContactNo ?? "",
      scrCategoryId: scrCategoryId ?? -1,
      scrCustomerAddress: scrCustomerAddress ?? "",
      scrFindings: scrFindings ?? "",
      srcIsLedger: srcIsLedger ?? false,
      srcLedgerId: srcLedgerId ?? -1,
      scrCreatedDate: scrCreatedDate ?? "",
      scrCreatedBy: scrCreatedBy ?? -1,
      scrUpdatedDate: scrUpdatedDate ?? "",
      scrUpdatedBy: scrUpdatedBy ?? "",
    );
  }
}
