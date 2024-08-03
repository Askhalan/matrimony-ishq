import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/features/auth/data/models/pref_model.dart';
import 'package:ishq/features/auth/data/models/user_model.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';

abstract interface class ProfileRemoteDatasource {
  Future<void> saveUserRecord({required UserModel user});
  Future<UserModel> fetchCurrentUser();
  Future addPreference({required PrefModel preferences});
  Future<String> uploadImage({required String path, required XFile image});
}

class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource {
  ProfileRemoteDatasourceImpl(
      {required this.storage, required this.db, required this.auth});

  final FirebaseFirestore db;
  final FirebaseAuth auth;
  final FirebaseStorage storage;

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
      final response =
          await db.collection("users").doc(auth.currentUser!.uid).get();
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

  //-------- Add Preferences
  @override
  Future<void> addPreference({required PrefModel preferences}) async {
    try {
      await db
          .collection('users')
          .doc(preferences.uid)
          .collection('preferences')
          .doc()
          .set(preferences.toJson());
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

  @override
  Future<String> uploadImage(
      {required String path, required XFile image}) async {
    try {
      final ref = storage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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
