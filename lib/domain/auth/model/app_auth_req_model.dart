import 'package:equatable/equatable.dart';

class AppAuthReqModel extends Equatable {
  final String clientId;
  final String secret;

  const AppAuthReqModel({required this.clientId, required this.secret});

  @override
  List<Object?> get props => [clientId, secret];

  Map<String, dynamic> toMap() {
    return {"clientId": clientId, "secret": secret};
  }
}
