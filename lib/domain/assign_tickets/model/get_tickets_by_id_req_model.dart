import 'package:equatable/equatable.dart';

class GetTicketsByIdReqModel extends Equatable {
  final int id;

  const GetTicketsByIdReqModel({required this.id});
  @override
  List<Object?> get props => [id];

  factory GetTicketsByIdReqModel.dummy() {
    return const GetTicketsByIdReqModel(id: -1);
  }

  Map<String, dynamic> toMap() {
    return {"Id": id};
  }
}
