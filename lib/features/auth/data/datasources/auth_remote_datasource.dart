// Here we are creating interfaces,to make a strict enforcement for the function created over here

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';
import 'package:ishq/utils/exceptions/server_exception.dart';

abstract interface class AuthRemoteDatasource {
  Future<String> signupWithEmailPassword({
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future logoutUser();
}


class AuthRemoteDataSourceImpl extends AuthRemoteDatasource {
  final FirebaseAuth authInstance;

  AuthRemoteDataSourceImpl({required this.authInstance});

  //------------------- SIGNUP ----------------------
  @override
  Future<String> signupWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }
      return response.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw JFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    }
  }

  //------------------- LOGIN ----------------------
  @override
  Future<String> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }
      return response.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw JFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    }
  }

  //------------------- LOGOUT ----------------------
  @override
  Future logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw JFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . Please try again';
    }
  }

  //---------------- DELETE ACCOUNT -----------------
}
