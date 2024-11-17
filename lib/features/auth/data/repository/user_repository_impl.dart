
import 'package:chronicle/features/auth/domain/model/user_model.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import '../../../../cors/failure/failure.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_remote_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImpl({required this.userRemoteDatasource});

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      return Right(await userRemoteDatasource.getUser());
    }
    on DioException catch (e){
      return Left(AuthFailure(message: e.response?.data['error']));
    }
    catch (e) {
      return Left(AuthFailure(message: 'Authorization error'));
    }
  }
}