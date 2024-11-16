import 'package:chronicle/cors/failure/failure.dart';
import 'package:chronicle/features/auth/domain/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either<Failure, UserModel>> loginWithGoogle();
}