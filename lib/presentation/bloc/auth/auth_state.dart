part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final AppFailure err;

  const AuthError({required this.err});
  @override
  List<Object?> get props => [err];
}

/// App Auth Success (appToken)
final class AppAuthSuccess extends AuthState {
  final AppAuthResModel model;

  const AppAuthSuccess({required this.model});

  @override
  List<Object?> get props => [model];
}

/// User Auth Success (userToken)
final class UserAuthSuccess extends AuthState {
  final UserAuthResModel model;

  const UserAuthSuccess({required this.model});

  @override
  List<Object?> get props => [model];
}

/// Branches Loaded after user login
final class BranchesLoadedState extends AuthState {
  final LocationModel locationModel;

  const BranchesLoadedState(this.locationModel);

  @override
  List<Object?> get props => [locationModel];
}

class ShowAppAuthPage extends AuthState {}

class ShowUserLoginPage extends AuthState {}

class AuthLoggedIn extends AuthState {}

final class TokenExpiredState extends AuthState {}

final class LogoutSuccess extends AuthState {}
