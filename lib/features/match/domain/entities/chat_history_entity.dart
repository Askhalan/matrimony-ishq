import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/match/domain/entities/chat_entity.dart';

class ChatHistoryItem {
  final Chat chat;
  final UserEntity otherUser;

  ChatHistoryItem({
    required this.chat,
    required this.otherUser,
  });
}