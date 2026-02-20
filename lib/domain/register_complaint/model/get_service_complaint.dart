import 'package:equatable/equatable.dart';

class GetServiceComplaint extends Equatable {
  final int scrId;
  final int scrTokenNo;
  final String scrTokenDate;
  final String scrCustomerName;
  final String scrMobileNo;
  final String scrEmail;
  final String scrContactNo;
  final int scrCategoryId;
  final String scrCustomerAddress;
  final String scrFindings;
  final bool srcIsLedger;
  final int srcLedgerId;
  final String scrCreatedDate;
  final int scrCreatedBy;
  final String scrUpdatedDate;
  final String scrUpdatedBy;

  const GetServiceComplaint({
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

  factory GetServiceComplaint.dummy() {
    return const GetServiceComplaint(
      scrId: -1,
      scrTokenNo: 0,
      scrTokenDate: '',
      scrCustomerName: '',
      scrMobileNo: '',
      scrEmail: '',
      scrContactNo: '',
      scrCategoryId: -1,
      scrCustomerAddress: '',
      scrFindings: '',
      srcIsLedger: false,
      srcLedgerId: -1,
      scrCreatedDate: '',
      scrCreatedBy: -1,
      scrUpdatedDate: '',
      scrUpdatedBy: '',
    );
  }

  @override
  List<Object> get props => [
    scrId,
    scrTokenNo,
    scrTokenDate,
    scrCustomerName,
    scrMobileNo,
    scrEmail,
    scrContactNo,
    scrCategoryId,
    scrCustomerAddress,
    scrFindings,
    srcIsLedger,
    srcLedgerId,
    scrCreatedDate,
    scrCreatedBy,
    scrUpdatedDate,
    scrUpdatedBy,
  ];
}
