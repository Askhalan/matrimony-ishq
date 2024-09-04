import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/match/data/datasources/chat_datasource.dart';
import 'package:ishq/features/match/data/models/chat_model.dart';
import 'package:ishq/features/match/data/models/message_model.dart';
import 'package:ishq/features/match/domain/entities/message_entity.dart';
import 'package:ishq/features/match/domain/repositories/chat_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class ChatRepositoryImpl extends ChatRepository {
  ChatRepositoryImpl({required this.chatDatasource});
  final ChatDatasource chatDatasource;

  @override
  Future<Either<Failure, bool>> checkChatExists(String uid1) async {
    try {
      final result = await chatDatasource.checkChatExists(uid1);
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createNewChat(String uid1) async {
    try {
      final result = await chatDatasource.checkChatExists(uid1);
      if (!result) {
        await chatDatasource.createNewChat(uid1);
      }
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendChatMessage(
      String uid1, Message message) async {
    try {
      log('Entered ChatRepo');
      final senMessage = MessageModel(
          senderID: message.senderID,
          content: message.content,
          sentAt: message.sentAt,
          messageType: message.messageType);
      await chatDatasource.sendChatMessage(uid1, senMessage);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<ChatModel> getChatMessagesStream(String uid1) {
    return chatDatasource.getChatMessagesStream(uid1);
  }
}
