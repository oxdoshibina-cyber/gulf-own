import 'package:equatable/equatable.dart';

class ServiceReturnRequestModel extends Equatable{
  final int siEntryNo;
  final int asId;
  final String remarks;

  const ServiceReturnRequestModel({
    required this.siEntryNo,
    required this.asId,
    required this.remarks,
  });

  @override
  List<Object?> get props => [
    siEntryNo,
    asId,
    remarks,
  ];

  Map<String, dynamic> toMap() {
    return {
      "si_entryno": siEntryNo,
      "as_id": asId,
      "remarks": remarks,
    };

  }
  factory ServiceReturnRequestModel.dummy(){
    return const ServiceReturnRequestModel(
      siEntryNo: -1,
      asId: -1,
      remarks: "",
    );
  }

  ServiceReturnRequestModel copyWith({
    int? siEntryNo,
    int? asId,
    String? remarks,
  }){
    return ServiceReturnRequestModel(
      siEntryNo: siEntryNo ?? this.siEntryNo,
      asId: asId ?? this.asId,
      remarks: remarks ?? this.remarks,
    );
  }
}


