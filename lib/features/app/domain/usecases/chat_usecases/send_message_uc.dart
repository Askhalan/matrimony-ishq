import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/app/domain/entities/message_entity.dart';
import 'package:ishq/features/app/domain/repositories/chat_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class SendMessageUc {
  final ChatRepository chatRepository;

  SendMessageUc({required this.chatRepository});

  Future<Either<Failure, void>> call(SendMessageParams params) {
    log('ENtered UC');
    return chatRepository.sendChatMessage(params.uid, params.message);
  }
}

class SendMessageParams {
  final String uid;
  final Message message;
  SendMessageParams( {required this.message,required this.uid});
}
