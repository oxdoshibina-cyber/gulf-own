// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AppAuthResModel extends Equatable {
  final String token;
  final bool status;

  const AppAuthResModel({required this.token, required this.status});

  factory AppAuthResModel.fromMap(Map<String, dynamic> map) {
    return AppAuthResModel(token: map['token'], status: map['status']);
  }

  factory AppAuthResModel.dummy() {
    return AppAuthResModel(token: '', status: false);
  }

  Map<String, dynamic> toMap() {
    return {'token': token, 'status': status};
  }

  @override
  List<Object?> get props => [token, status];

  AppAuthResModel copyWith({String? token, bool? status}) {
    return AppAuthResModel(
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }
}
