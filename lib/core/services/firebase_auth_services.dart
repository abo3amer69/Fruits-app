import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_apps/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      log(
        'FirebaseAuthException in creatUserWithEmaimAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(
          message: 'كلمة المرور ضعيفة جداً، الرجاء اختيار كلمة أقوى.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقا ز الرجاء تسجيل الدخول',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'لا يوجد اتصال بالانترنت، الرجاء المحاولة لاحقاً.',
        );
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.',
        );
      }
    } catch (e) {
      log('Exception in creatUserWithEmaimAndPassword: ${e.toString()}');
      throw CustomException(message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'المستخدم غير موجود، الرجاء التحقق من البريد الإلكتروني.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'كلمة المرور غير صحيحة، الرجاء المحاولة مرة أخرى.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'لا يوجد اتصال بالانترنت، الرجاء المحاولة لاحقاً.',
        );
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.',
        );
      }
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: 'لقد حدث خطأ ما، الرجاء المحاولة لاحقاً.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
