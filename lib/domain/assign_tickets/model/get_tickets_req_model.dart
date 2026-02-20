import 'package:equatable/equatable.dart';

class GetTicketsReqModel extends Equatable {
  final String status;

  const GetTicketsReqModel({required this.status});
  @override
  List<Object?> get props => [status];

  factory GetTicketsReqModel.dummy() {
    return const GetTicketsReqModel(status: '');
  }
}
