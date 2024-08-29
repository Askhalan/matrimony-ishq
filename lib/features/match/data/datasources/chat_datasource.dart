import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';

abstract interface class ChatDatasource {
  Future<bool> checkChatExists(String uid1, String uid2);
  //--------------------------------------------------
}

class ChatDatasourceImpl extends ChatDatasource {
  ChatDatasourceImpl({required this.db});
  final FirebaseFirestore db;

  @override
  Future<bool> checkChatExists(String uid1, String uid2) async {
    try {
      String chatId = DataHelper.generateChatID(uid1: uid1, uid2: uid2);
      final result = await db.collection('chats').doc(chatId).get();
      return result.exists;
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
