import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    User? user;
    try {
      user = await firebaseAuthServices.creatUserWithEmaimAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uid: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deletUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      deletUser(user);
      log(
        'Exception in AuthRepoImpl creatUserWithEmaimAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'));
    }
  }

  Future<void> deletUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deletUser();
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
      var userEntity = await getUserData(uid: user.uid);
      return Right(userEntity);
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
    User? user;
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseServices.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return Right(userEntity);
    } catch (e) {
      await deletUser(user);
      log('Exception in AuthRepoImpl signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);

      return Right(userEntity);
    } catch (e) {
      await deletUser(user);
      log('Exception in AuthRepoImpl signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'));
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity user}) async {
    await databaseServices.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      documentId: user.uid,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseServices.getData(
      path: BackendEndpoint.getUsersData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }
}
