import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/features/auth/data/models/user_model.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';

abstract interface class ProfileRemoteDatasource {
  Future<void> saveUserRecord({required UserModel user});

  Future<UserModel> fetchCurrentUser();
}

class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource {
  ProfileRemoteDatasourceImpl({required this.db, required this.auth});

  final FirebaseFirestore db;
  final FirebaseAuth auth;

  //-------- Save User data from Signup
  @override
  Future<void> saveUserRecord({required UserModel user}) async {
    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(user.copyWith(uid: auth.currentUser!.uid).tojson());
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

  //-------- Fetch Current  User data
  @override
  Future<UserModel> fetchCurrentUser() async {
    try {
      final response = await db.collection("users").doc(auth.currentUser!.uid).get();
      if (response.exists) {
        return UserModel.fromJson(response);
      } else {
        return UserModel.empty();
      }
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
