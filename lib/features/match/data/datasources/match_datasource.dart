import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/features/match/data/models/user_model_match.dart';
import 'package:ishq/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';

abstract interface class MatchDatasource {
  Future<List<UserModelMatch>> getAllUser();
}

class MatchDataSourceImpl implements MatchDatasource {
  final FirebaseFirestore db;

  MatchDataSourceImpl({required this.db});
  @override
  Future<List<UserModelMatch>> getAllUser() async {
    try {
      final response = await db.collection('users').get();
      return response.docs.map((e) => UserModelMatch.fromJson(e)).toList();
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
}
