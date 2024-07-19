import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/features/auth/data/models/user_model.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';

abstract interface class ProfileRemoteDatasource {
  Future<void> saveUserRecord({required UserModel user});
}

class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource {
  ProfileRemoteDatasourceImpl({required this.db});

  final FirebaseFirestore db;
  

  //-------- Save User data from Signup
  @override
  Future<void> saveUserRecord({required UserModel user}) async {
     try {
      await db.collection("users").doc(user.uid).set(user.tojson());
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

  
 
}
