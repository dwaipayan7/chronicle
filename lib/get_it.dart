import 'package:chronicle/cors/api/api_client.dart';
import 'package:chronicle/features/auth/data/data_source/auth_remote_datasource.dart';
import 'package:chronicle/features/auth/data/data_source/user_remote_repository.dart';
import 'package:chronicle/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chronicle/features/auth/data/repository/user_repository_impl.dart';
import 'package:chronicle/features/auth/domain/repository/auth_repository.dart';
import 'package:chronicle/features/auth/domain/repository/user_repository.dart';
import 'package:chronicle/features/auth/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup(){
  registerApiClient();
  registerDataSource();
  registerRepository();
  registerBloc();
}

void registerApiClient(){
  getIt.registerSingleton(ApiClient());
}

void registerDataSource(){
  var dio = getIt<ApiClient>().getDio();

  getIt.registerSingleton(AuthRemoteDatasource(dio: dio));
  getIt.registerSingleton(UserRemoteDatasource(dio: dio));

}

void registerRepository(){
  getIt.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(authRemoteDataSource: getIt()));
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(userRemoteDatasource: getIt())
  );
}

void registerBloc(){
  getIt.registerFactory(() => UserBloc(authRepository: getIt(), userRepository: getIt()));
}