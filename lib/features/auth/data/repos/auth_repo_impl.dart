import 'package:dartz/dartz.dart';
import 'package:fruits_apps/core/errors/failure.dart';
import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_apps/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<UserEntity, Failure>> creatUserWithEmaimAndPassword(String email, String password) {
    // TODO: implement creatUserWithEmaimAndPassword
    throw UnimplementedError();
  }
}