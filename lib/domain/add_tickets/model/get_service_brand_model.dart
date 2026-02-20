import 'package:equatable/equatable.dart';

class GetServiceBrandModel extends Equatable {
  final int companyId;
  final String companyName;
  final String companyRemarks;

  const GetServiceBrandModel({
    required this.companyId,
    required this.companyName,
    required this.companyRemarks,
  });

  factory GetServiceBrandModel.dummy() =>
      const GetServiceBrandModel(companyId: -1, companyName: '', companyRemarks: '');
  @override
  List<Object?> get props => [companyId, companyName, companyRemarks];

  GetServiceBrandModel copyWith({
    int? companyId,
    String? companyName,
    String? companyRemarks,
  }) {
    return GetServiceBrandModel(
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      companyRemarks: companyRemarks ?? this.companyRemarks,
    );
  }
}
