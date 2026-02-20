part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Trigger App Authentication (get app token)
class AppAuth extends AuthEvent {
  final AppAuthReqModel appAuthReqModel;

  const AppAuth({required this.appAuthReqModel});

  @override
  List<Object?> get props => [appAuthReqModel];
}

/// Trigger User Authentication (get user token)
class UserAuth extends AuthEvent {
  final UserAuthReqModel userAuthReqModel;

  const UserAuth({required this.userAuthReqModel});

  @override
  List<Object?> get props => [userAuthReqModel];
}

class CheckLoginStatus extends AuthEvent {}

class GetBranchesEvent extends AuthEvent {}

/// Logout
class LogoutApp extends AuthEvent {}
