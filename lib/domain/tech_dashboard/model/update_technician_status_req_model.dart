import 'package:equatable/equatable.dart';

class UpdateTicketStatusReqModel extends Equatable {
  final int ticketId;
  final String status;
  final String remarks;
  final int technicianId;

  const UpdateTicketStatusReqModel({
    required this.ticketId,
    required this.status,
    required this.remarks,
    required this.technicianId,
  });

  @override
  List<Object?> get props => [
        ticketId,
        status,
        remarks,
        technicianId,
      ];

  /// 🔥 API payload
  Map<String, dynamic> toMap() {
    return {
      "ticket_id": ticketId,
      "status": status,
      "remarks": remarks,
      "technician_id": technicianId,
    };
  }

  /// 🔹 Dummy for Bloc initial state
  factory UpdateTicketStatusReqModel.dummy() {
    return const UpdateTicketStatusReqModel(
      ticketId: -1,
      status: '',
      remarks: '',
      technicianId: -1,
    );
  }

  /// 🔁 copyWith
  UpdateTicketStatusReqModel copyWith({
    int? ticketId,
    String? status,
    String? remarks,
    int? technicianId,
  }) {
    return UpdateTicketStatusReqModel(
      ticketId: ticketId ?? this.ticketId,
      status: status ?? this.status,
      remarks: remarks ?? this.remarks,
      technicianId: technicianId ?? this.technicianId,
    );
  }
}
