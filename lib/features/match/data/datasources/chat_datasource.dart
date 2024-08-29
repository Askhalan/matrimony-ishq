import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/features/match/data/models/chat_model.dart';
import 'package:ishq/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';

abstract interface class ChatDatasource {
  Future<bool> checkChatExists(String uid1, String uid2);
  Future<void> createNewChat(String uid1, String uid2);
  //--------------------------------------------------
}

class ChatDatasourceImpl extends ChatDatasource {
  ChatDatasourceImpl({required this.db});
  final FirebaseFirestore db;

//------------------------------- CHECK CHAT EXISTS ------------------------------- 
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

//------------------------------- CREATE NEW CHAT -------------------------------- 

  @override
  Future<void> createNewChat(String uid1, String uid2) async {
    try {
      String chatId = DataHelper.generateChatID(uid1: uid1, uid2: uid2);
      final newChat =
          ChatModel(id: chatId, participants: [uid1, uid2], messages: []);
      await db.collection('chats').doc(chatId).set(newChat.toJson());
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
