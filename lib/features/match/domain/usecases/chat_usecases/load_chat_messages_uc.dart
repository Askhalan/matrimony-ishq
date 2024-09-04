import 'dart:developer';

import 'package:ishq/features/match/domain/entities/chat_entity.dart';
import 'package:ishq/features/match/domain/repositories/chat_repository.dart';

class LoadChatMessagesUC {
  final ChatRepository chatRepository;

  LoadChatMessagesUC({required this.chatRepository});

  Stream<Chat> call(LoadChatMessagesParams params) {
    log('ENtered UC');
    return chatRepository.getChatMessagesStream(params.uid);
  }
}

class LoadChatMessagesParams {
  final String uid;
  LoadChatMessagesParams({required this.uid});
}
