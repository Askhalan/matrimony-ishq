// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

class ChatEvent {}

class StartChat extends ChatEvent {
  String uid;
  StartChat({required this.uid});
}

class SendMessage extends ChatEvent {
  String uid;
  ChatMessage message;
  SendMessage({
    required this.uid,
    required this.message,
  });
}
