import 'package:equatable/equatable.dart';

class ServiceReturnResponseModel extends Equatable{
  final int success;
  final String message;

  const ServiceReturnResponseModel({
    required this.success,
    required this.message,
  });

  factory ServiceReturnResponseModel.dummy(){
    return const ServiceReturnResponseModel(
      success: -1,
      message: "",
    );
  }

  @override
  List<Object?> get props => [
    success,
    message,
  ];
}
