import 'package:dartz/dartz.dart';
import 'package:fruits_apps/core/errors/exceptions.dart';
import 'package:fruits_apps/core/errors/failures.dart';
import 'package:fruits_apps/core/services/firebase_auth_services.dart';
import 'package:fruits_apps/features/auth/data/models/user_model.dart';
import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_apps/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
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
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(
        ServerFailure('لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.'),
      );
    }
  }
}
