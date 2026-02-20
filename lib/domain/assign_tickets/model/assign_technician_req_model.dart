import 'package:equatable/equatable.dart';

class AssignTechnicianReqModel extends Equatable {
  final int entryNo;
  final int id;

  const AssignTechnicianReqModel({required this.entryNo, required this.id});
  @override
  List<Object?> get props => [entryNo, id];

  factory AssignTechnicianReqModel.dummy() {
    return const AssignTechnicianReqModel(entryNo: -1, id: -1);
  }

  Map<String, dynamic> toMap() {
    return {"si_entryno": entryNo, "as_id": id};
  }
}
