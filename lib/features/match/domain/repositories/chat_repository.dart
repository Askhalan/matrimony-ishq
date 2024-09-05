import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/match/domain/entities/chat_entity.dart';
import 'package:ishq/features/match/domain/entities/chat_history_entity.dart';
import 'package:ishq/features/match/domain/entities/message_entity.dart';
import 'package:ishq/utils/error/failure.dart';

abstract class ChatRepository{
  Future<Either<Failure , bool>> checkChatExists (String uid1);
  Future<Either<Failure , void>> createNewChat (String uid1);
  Future<Either<Failure , void>> sendChatMessage (String uid1 , Message message);
  Stream<Chat> getChatMessagesStream(String uid1);
   Stream<List<ChatHistoryItem>> getAllChats();


}