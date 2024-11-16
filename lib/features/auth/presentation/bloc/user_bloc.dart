import 'package:bloc/bloc.dart';
import 'package:chronicle/features/auth/domain/model/user_model.dart';
import 'package:chronicle/features/auth/domain/repository/auth_repository.dart';
import 'package:chronicle/features/auth/presentation/bloc/user_state.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepository authRepository;

  UserBloc(super.initialState, {required this.authRepository}:super(UserInitial()) )

  {
    on<LoginWithGoogleEvent>(_onLoginWithGoogleEvent);
  }

  Future<void> _onLoginWithGoogleEvent(
      LoginWithGoogleEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());

    // Call the repository method
    final result = await authRepository.loginWithGoogle();

    // Handle the Either type result
    result.fold(
          (failure) => emit(ErrorState(errorMessage: '')),
          (user) => emit(SuccessState(users: [user])),
    );
  }
}
