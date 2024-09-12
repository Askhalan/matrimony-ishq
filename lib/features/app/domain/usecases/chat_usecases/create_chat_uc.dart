import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/app/domain/repositories/chat_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class CreateChatUc {
  final ChatRepository chatRepository;

  CreateChatUc({required this.chatRepository});

  Future<Either<Failure, void>> call(CreateChatparams params) {
    return chatRepository.createNewChat(params.uid);
  }
}

class CreateChatparams {
  final String uid;
  CreateChatparams({required this.uid});
}
