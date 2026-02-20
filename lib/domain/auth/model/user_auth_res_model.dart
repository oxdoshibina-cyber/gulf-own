// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserAuthResModel extends Equatable {
  final String token;
  final String expiration;
  final bool status;
  final String userRole;

  const UserAuthResModel({
    required this.token,
    required this.expiration,
    required this.status,
    required this.userRole,
  });
  factory UserAuthResModel.fromMap(Map<String, dynamic> map) {
    return UserAuthResModel(
      token: map['token'],
      expiration: map['expiration'],
      status: map['status'],
      userRole: map['user_role'],
    );
  }

  factory UserAuthResModel.dummy() {
    return UserAuthResModel(
      token: '',
      expiration: '',
      status: false,
      userRole: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'expiration': expiration,
      'status': status,
      'userRole': userRole,
    };
  }

  @override
  List<Object?> get props => [token, expiration, status, userRole];

  UserAuthResModel copyWith({
    String? token,
    String? expiration,
    bool? status,
    String? userRole,
  }) {
    return UserAuthResModel(
      token: token ?? this.token,
      expiration: expiration ?? this.expiration,
      status: status ?? this.status,
      userRole: userRole ?? this.userRole,
    );
  }
}
