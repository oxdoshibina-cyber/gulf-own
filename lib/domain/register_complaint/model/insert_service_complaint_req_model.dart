import 'package:equatable/equatable.dart';

class InsertServiceComplaintReqModel extends Equatable {
  final int scrId;
  final String scrCustomerName;
  final String scrMobileNo;
  final String scrEmail;
  final String scrContactNo;
  final int scrCategoryId;
  final String scrCustomerAddress;
  final String scrFindings;
  final bool srcIsLedger;
  final int srcLedgerId;
  final int userId;

  const InsertServiceComplaintReqModel({
    required this.scrId,
    required this.scrCustomerName,
    required this.scrMobileNo,
    required this.scrEmail,
    required this.scrContactNo,
    required this.scrCategoryId,
    required this.scrCustomerAddress,
    required this.scrFindings,
    required this.srcIsLedger,
    required this.srcLedgerId,
    required this.userId,
  });

  @override
  List<Object?> get props => [
    scrId,
    scrCustomerName,
    scrMobileNo,
    scrEmail,
    scrContactNo,
    scrCategoryId,
    scrCustomerAddress,
    scrFindings,
    srcIsLedger,
    srcLedgerId,
    userId,
  ];

  Map<String, dynamic> toMap() {
    return {
      "scr_id": scrId,
      "scr_customer_name": scrCustomerName,
      "scr_mobile_no": scrMobileNo,
      "scr_email": scrEmail,
      "scr_contact_no": scrContactNo,
      "scr_category_id": scrCategoryId,
      "scr_customer_address": scrCustomerAddress,
      "scr_findings": scrFindings,
      "src_isLedger": srcIsLedger,
      "src_ledger_id": srcLedgerId,
      "user_id": userId,
    };
  }

  factory InsertServiceComplaintReqModel.dummy() {
    return const InsertServiceComplaintReqModel(
      scrId: -1,
      scrCustomerName: '',
      scrMobileNo: '',
      scrEmail: '',
      scrContactNo: '',
      scrCategoryId: -1,
      scrCustomerAddress: '',
      scrFindings: '',
      srcIsLedger: false,
      srcLedgerId: -1,
      userId: -1,
    );
  }

  InsertServiceComplaintReqModel copyWith({
    int? scrId,
    String? scrCustomerName,
    String? scrMobileNo,
    String? scrEmail,
    String? scrContactNo,
    int? scrCategoryId,
    String? scrCustomerAddress,
    String? scrFindings,
    bool? srcIsLedger,
    int? srcLedgerId,
    int? userId,
  }) {
    return InsertServiceComplaintReqModel(
      scrId: scrId ?? this.scrId,
      scrCustomerName: scrCustomerName ?? this.scrCustomerName,
      scrMobileNo: scrMobileNo ?? this.scrMobileNo,
      scrEmail: scrEmail ?? this.scrEmail,
      scrContactNo: scrContactNo ?? this.scrContactNo,
      scrCategoryId: scrCategoryId ?? this.scrCategoryId,
      scrCustomerAddress: scrCustomerAddress ?? this.scrCustomerAddress,
      scrFindings: scrFindings ?? this.scrFindings,
      srcIsLedger: srcIsLedger ?? this.srcIsLedger,
      srcLedgerId: srcLedgerId ?? this.srcLedgerId,
      userId: userId ?? this.userId,
    );
  }
}
