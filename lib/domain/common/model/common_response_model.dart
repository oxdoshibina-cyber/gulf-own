import 'package:equatable/equatable.dart';

class CommonResponseModel extends Equatable {
  final String status;
  final String message;

  const CommonResponseModel({
    required this.status,
    required this.message,
  });
  @override
  List<Object?> get props => [status, message];

  factory CommonResponseModel.dummy() {
    return const CommonResponseModel(status: '', message: '');
  }
}



