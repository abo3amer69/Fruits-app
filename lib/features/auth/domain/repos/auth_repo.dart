import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> creatUserWithEmaimAndPassword(
    String email,
    String password,
  );
}
