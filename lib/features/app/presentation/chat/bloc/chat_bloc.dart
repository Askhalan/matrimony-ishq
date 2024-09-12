import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/app/domain/entities/message_entity.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/create_chat_uc.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/send_message_uc.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<StartChat>(_onStartChat);
    on<SendMessage>(_onSendMessage);
  }

  void _onStartChat(StartChat event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    final createChatUc = serviceLocator<CreateChatUc>();
    await createChatUc(CreateChatparams(uid: event.uid));
    emit(ChatFound());
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    final Message message = Message(
        content: event.message.text,
        messageType: 'text',
        senderID: CurrentUser().uid!,
        sentAt: Timestamp.fromDate(event.message.createdAt));
    final sendMessageUc = serviceLocator<SendMessageUc>();
    final result = await sendMessageUc(
        SendMessageParams(uid: event.uid, message: message));
    result.fold((l) {
      log(l.message);
    }, (r) {});
  }
}
