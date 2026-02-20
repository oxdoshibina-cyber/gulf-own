// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserAuthReqModel extends Equatable {
  final String userName;
  final String password;
  final String location;

  const UserAuthReqModel({
    required this.userName,
    required this.password,
    required this.location,
  });

  @override
  List<Object?> get props => [userName, password, location];

  Map<String, dynamic> toMap() {
    return {"userName": userName, "password": password, "location": location};
  }

  UserAuthReqModel copyWith({
    String? userName,
    String? password,
    String? location,
  }) {
    return UserAuthReqModel(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      location: location ?? this.location,
    );
  }
}
