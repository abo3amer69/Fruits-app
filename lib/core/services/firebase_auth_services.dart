import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_apps/core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> creatUserWithEmaimAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException in creatUserWithEmaimAndPassword: ${e.toString()} and code: ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً، الرجاء اختيار كلمة أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقا ز الرجاء تسجيل الدخول',
        );
      }
      else if(e.code=='network-request-failed')
      {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت، الرجاء المحاولة لاحقاً.');
      }
      else{
        throw CustomException(message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.');
      }
    } catch (e) {
      log('Exception in creatUserWithEmaimAndPassword: ${e.toString()}');
      throw CustomException(message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.');
    }
  }
}
