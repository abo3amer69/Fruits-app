import 'package:dartz/dartz.dart';
import 'package:fruits_apps/core/errors/failures.dart';
import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<UserEntity, Failure>> creatUserWithEmaimAndPassword(
    String email,
    String password,
  );
}
