// Here we are creating interfaces,to make a strict enforcement for the function created over here

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';

abstract interface class ProfileRemoteDatasource {
  Future<void> saveUserRecord({
    required UserCredential userCredential
  });

}

class AuthRemoteDataSourceImpl extends ProfileRemoteDatasource {
  final FirebaseAuth authInstance;
  AuthRemoteDataSourceImpl({required this.authInstance});
  
  @override
  Future<void> saveUserRecord({required UserCredential userCredential}) async{
    
    try {
      
     
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

  //------------------- ADD USER DATA----------------------

  

  //----------------- FETCH CURRENT USER ------------------

  //----------------- DELETE CURRENT USER -----------------

  //------------------ EDIT CURRENT USER ------------------
}
