import 'package:equatable/equatable.dart';

class RelocateTechnicianReqModel extends Equatable {
  final int siEntryNo;
  final int asId;
  final String remarks;

  const RelocateTechnicianReqModel({
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

  /// 🔥 API payload (query params)
  Map<String, dynamic> toMap() {
    return {
      "si_entryno": siEntryNo,
      "as_id": asId,
      "remarks": remarks,
    };
  }

  /// 🔹 Dummy for Bloc initial state
  factory RelocateTechnicianReqModel.dummy() {
    return const RelocateTechnicianReqModel(
      siEntryNo: -1,
      asId: -1,
      remarks: '',
    );
  }

  /// 🔁 copyWith
  RelocateTechnicianReqModel copyWith({
    int? siEntryNo,
    int? asId,
    String? remarks,
  }) {
    return RelocateTechnicianReqModel(
      siEntryNo: siEntryNo ?? this.siEntryNo,
      asId: asId ?? this.asId,
      remarks: remarks ?? this.remarks,
    );
  }
}
