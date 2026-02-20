import 'package:equatable/equatable.dart';

class InsertTicketResModel extends Equatable {
  final String message;
  final int data;

  const InsertTicketResModel({required this.message, required this.data});
  @override
  List<Object?> get props => [message, data];

  factory InsertTicketResModel.dummy() {
    return const InsertTicketResModel(message: '', data: -1);
  }
}
