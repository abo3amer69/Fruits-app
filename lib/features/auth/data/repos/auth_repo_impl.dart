import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_apps/core/errors/exceptions.dart';
import 'package:fruits_apps/core/errors/failures.dart';
import 'package:fruits_apps/core/services/database_services.dart';
import 'package:fruits_apps/core/services/firebase_auth_services.dart';
import 'package:fruits_apps/core/utils/backend_endpoint.dart';
import 'package:fruits_apps/features/auth/data/models/user_model.dart';
import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_apps/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.databaseServices,
  });
  @override
  Future<Either<Failure, UserEntity>> creatUserWithEmaimAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthServices.creatUserWithEmaimAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel.fromFirebaseUser(user);
      await addData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl creatUserWithEmaimAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'));
    }
  }

  @override
  Future<dynamic> addData({required UserEntity user}) async {
    await databaseServices.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
    );
  }
}
