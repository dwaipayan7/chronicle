
import 'package:chronicle/features/auth/domain/model/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../cors/failure/failure.dart';

abstract class UserRepository{
  Future<Either<Failure,UserModel>> getUser();
}