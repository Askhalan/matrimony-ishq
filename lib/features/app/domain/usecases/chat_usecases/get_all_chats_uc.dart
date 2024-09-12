import 'package:ishq/features/app/domain/entities/chat_history_entity.dart';
import 'package:ishq/features/app/domain/repositories/chat_repository.dart';

class GetAllChatsUC {
  GetAllChatsUC({required this.chatRepository});

  final ChatRepository chatRepository;

  Stream<List<ChatHistoryItem>> call() {
    return chatRepository.getAllChats();
  }
}
