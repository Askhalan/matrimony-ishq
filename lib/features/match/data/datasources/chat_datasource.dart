import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ishq/features/auth/data/models/user_model.dart';
import 'package:ishq/features/match/data/models/chat_loading_model.dart';
import 'package:ishq/features/match/data/models/chat_model.dart';
import 'package:ishq/features/match/data/models/message_model.dart';
import 'package:ishq/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';

abstract interface class ChatDatasource {
  Future<bool> checkChatExists(String uid1);
  Future<void> createNewChat(String uid1);
  Future<void> sendChatMessage(String uid1, MessageModel message);
  Stream<ChatModel> getChatMessagesStream(String uid1);
  Stream<List<ChatHistoryItemModel>> getAllChatsStream();
  //--------------------------------------------------
}

class ChatDatasourceImpl extends ChatDatasource {
  ChatDatasourceImpl({
    required this.db,
    required this.auth,
  });
  final FirebaseFirestore db;
  final FirebaseAuth auth;

//------------------------------- CHECK CHAT EXISTS -------------------------------
  @override
  Future<bool> checkChatExists(String uid1) async {
    try {
      String chatId =
          DataHelper.generateChatID(uid1: uid1, uid2: auth.currentUser!.uid);
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
  Future<void> createNewChat(String uid1) async {
    try {
      String chatId =
          DataHelper.generateChatID(uid1: uid1, uid2: auth.currentUser!.uid);
      final newChat = ChatModel(
          id: chatId,
          participants: [uid1, auth.currentUser!.uid],
          messages: []);
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

  //------------------------------- SEND MESSAGE --------------------------------

  @override
  Future<void> sendChatMessage(String uid1, MessageModel message) async {
    try {
      String chatId =
          DataHelper.generateChatID(uid1: uid1, uid2: auth.currentUser!.uid);

      await db.collection('chats').doc(chatId).update({
        "messages": FieldValue.arrayUnion([
          message.toJson(),
        ])
      });
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

  //------------------------------- GET ALL MESSAGES OF A CHAT --------------------------------

  @override
  Stream<ChatModel> getChatMessagesStream(String uid1) {
    try {
      String chatId =
          DataHelper.generateChatID(uid1: uid1, uid2: auth.currentUser!.uid);

      return db.collection('chats').doc(chatId).snapshots().map((snapshot) {
        final data = snapshot.data();
        if (data != null) {
          // Convert the document snapshot data into a ChatModel
          return ChatModel.fromJson(data);
        } else {
          // Handle the case where the document doesn't exist or data is null
          throw Exception('Document does not exist or data is null');
        }
      });
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

//------------------------------- GET ALL CHATS --------------------------------


  @override
  Stream<List<ChatHistoryItemModel>> getAllChatsStream() {
  try {
    final result = db
        .collection('chats')
        .where('participants', arrayContains: auth.currentUser!.uid)
        .snapshots()
        .asyncMap((querySnapshot) async {
      // Process each document
      return await Future.wait(querySnapshot.docs.map((doc) async {
        final chatData = doc.data();

        // Identify the other user's UID
        final otherUserUid = chatData['participants']
            .firstWhere((uid) => uid != auth.currentUser!.uid);

        // Fetch the other user's details
        final otherUserDoc = await db.collection('users').doc(otherUserUid).get();

        // Use UserModel.fromJson with the DocumentSnapshot
        final otherUser = UserModel.fromJson(otherUserDoc);

        debugPrint('The other chat user name is :${otherUser.name}');

        // Construct the ChatModel and ChatHistoryItem
        final chatModel = ChatModel.fromJson(chatData);
        return ChatHistoryItemModel(
          chat: chatModel,
          otherUser: otherUser,
        );
      }).toList());
    });
    return result;
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
