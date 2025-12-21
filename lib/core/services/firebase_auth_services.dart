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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً، الرجاء اختيار كلمة أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقا ز الرجاء تسجيل الدخول',
        );
      }
      else{
        throw CustomException(message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.');
    }
  }
}
