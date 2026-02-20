import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulfownsalesview/core/build_config/build_config.dart';
import 'package:gulfownsalesview/data/shared_pref_helper/shared_pref_helper.dart';
import 'package:gulfownsalesview/domain/auth/model/app_auth_req_model.dart';
import 'package:gulfownsalesview/domain/auth/model/app_auth_res_model.dart';
import 'package:gulfownsalesview/domain/auth/model/location_model.dart';
import 'package:gulfownsalesview/domain/auth/model/user_auth_req_model.dart';
import 'package:gulfownsalesview/domain/auth/model/user_auth_res_model.dart';
import 'package:gulfownsalesview/domain/auth/repository/auth_repository.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AppAuth>(_appAuth);
    on<UserAuth>(_userAuth);
    on<LogoutApp>(_logout);
    on<CheckLoginStatus>(_checkLoginStatus);
    on<GetBranchesEvent>(_getBranches);
  }

  /// 🔹 Handle App Auth (fetch appToken)
  Future<void> _appAuth(AppAuth event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await authRepository.appAuth(event.appAuthReqModel);

    if (result.isLeft()) {
      final error = result.swap().getOrElse(
        () => AppFailure.client("Unknown error"),
      );
      emit(AuthError(err: error));
      return;
    }

    final data = result.getOrElse(
      () => AppAuthResModel(token: "", status: false),
    );

    BuildConfig.appToken = data.token;
    await SharedPrefHelper.saveAppToken(data.token);
    //await SharedPrefHelper.saveBaseUrl(BuildConfig.baseUrl);

    emit(AppAuthSuccess(model: data));
  }

  Future<void> _userAuth(UserAuth event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await authRepository.userAuth(event.userAuthReqModel);

    if (result.isLeft()) {
      final error = result.swap().getOrElse(
        () => AppFailure.client("Unknown error"),
      );
      emit(AuthError(err: error));
      return;
    }

    final data = result.getOrElse(() => UserAuthResModel.dummy());

    BuildConfig.userToken = data.token;
    await SharedPrefHelper.saveUserToken(data.token);

    if (BuildConfig.appToken != null && BuildConfig.appToken!.isNotEmpty) {
      await SharedPrefHelper.saveAppToken(BuildConfig.appToken!);
    }

    await Future.delayed(const Duration(milliseconds: 500));

    emit(UserAuthSuccess(model: data));
    add(GetBranchesEvent());
  }

  Future<void> _checkLoginStatus(
    CheckLoginStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final baseUrl = await SharedPrefHelper.getBaseUrl();
    final appToken = await SharedPrefHelper.getAppToken();
    final userToken = await SharedPrefHelper.getUserToken();

    log(
      "Checking Login => BaseUrl: $baseUrl | AppToken: $appToken | UserToken: $userToken",
    );

    if (baseUrl == null || baseUrl.isEmpty) {
      emit(ShowAppAuthPage());
      return;
    }

    if (appToken == null || appToken.isEmpty) {
      emit(ShowAppAuthPage());
      return;
    }

    if (userToken == null || userToken.isEmpty) {
      emit(ShowUserLoginPage());
      return;
    }

    emit(AuthLoggedIn());
  }

  /// 🔹 Handle Logout
  Future<void> _logout(LogoutApp event, Emitter<AuthState> emit) async {
    await SharedPrefHelper.clearTokens();
    BuildConfig.appToken = "";
    BuildConfig.userToken = "";
    emit(LogoutSuccess());
  }

  Future<void> _getBranches(
    GetBranchesEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await authRepository.getBranches();

    result.fold(
      (err) => emit(AuthError(err: err)),
      (data) => emit(BranchesLoadedState(data)),
    );
  }
}
