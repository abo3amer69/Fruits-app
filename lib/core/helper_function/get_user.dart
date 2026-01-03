import 'dart:convert';
import 'package:fruits_apps/constants.dart';
import 'package:fruits_apps/core/services/shared_preferances_singelton.dart';
import 'package:fruits_apps/features/auth/data/models/user_model.dart';
import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';



UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
