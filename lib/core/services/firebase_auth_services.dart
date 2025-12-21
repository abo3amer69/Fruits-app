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
        throw CustomException(message: '  the password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      }
      else{
        throw CustomException(message: 'Something went wrong, please try again later.');
      }
    } catch (e) {
      throw CustomException(message: 'Something went wrong, please try again later.');
    }
  }
}
