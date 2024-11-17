import 'package:chronicle/features/auth/domain/repository/auth_repository.dart';
import 'package:chronicle/features/auth/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart'; // For Either
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  UserBloc({required this.authRepository, required this.userRepository})
      : super(UserState.initial()) {
    on<LoginWithGoogleEvent>(onLoginWithGoogleEvent);
    on<GetUserEvent>(onGetUserEvent);
    // on<LogoutEvent>(onLogoutEvent);
  }

  Future<void> onLoginWithGoogleEvent(
      LoginWithGoogleEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    final data = await authRepository.loginWithGoogle();
    data.fold(
          (failure) => emit(state.copyWith(status: UserStatus.error)),
          (userModel) => emit(state.copyWith(
          status: UserStatus.success, userModel: userModel)),
    );
  }

  Future<void> onGetUserEvent(GetUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    final data = await userRepository.getUser();
    data.fold(
          (failure) => emit(state.copyWith(status: UserStatus.error)),
          (userModel) => emit(state.copyWith(
          status: UserStatus.success, userModel: userModel)),
    );
  }

  // Future<void> onLogoutEvent(LogoutEvent event, Emitter<UserState> emit) async {
  //   emit(state.copyWith(status: UserStatus.loading));
  //   final result = await authRepository.logout();
  //   result.fold(
  //         (failure) => emit(state.copyWith(
  //         status: UserStatus.error, errorMessage: failure.message)),
  //         (_) => emit(state.copyWith(status: UserStatus.logout)),
  //   );
  // }
}
